
-- этот парсер без проверки на синтаксис (будьте осторожны)
-- господи спаси этого чела который будет анализировать этот калл

-- любой массив начинается с индекса 1
-- any array starts at index 1

require"bit"

local json, offset, len

---------------------------------

local function EOFCheck() -- чтобы кто-либо не уебал себя вечным циклом
    if offset > len then error("unexpected end of data") end
end

local function utfToBytes(hex) --decode u+xxxx
    local n = tonumber(hex, 16)

    if n < 0x80 then
        return string.char(n)
    elseif n < 0x800 then
        return string.char(192 + bit.rshift(n, 6)) .. string.char(128 + bit.band(n, 63))
    elseif n < 0x10000 then
        return string.char(224 + bit.rshift(n, 12)) .. string.char(128 + bit.band(bit.rshift(n, 6), 63)) .. string.char(128 + bit.band(n, 63))
    end
end

local function skipWhiteSpace()
    while true do
        local char = code:sub(offset, offset)
        if char == "\n" or char == "\t" or char == "\r" or char == " " then offset = offset + 1 else break end
    end
end

local function parseNumber() --lol ez low speed
    local a = code:sub(offset):match("^%-?[0-9]+")
    if not a then return end

    local n = code:sub(offset):match("^%-?[0-9]+%.[0-9]+[eE][+-]?[0-9]+")
    if n then local out = tonumber(code:sub(offset, offset + #n-1)) offset = offset + #n return out end

    n = code:sub(offset):match("^%-?[0-9]+[eE][+-]?[0-9]+")
    if n then local out = tonumber(code:sub(offset, offset + #n-1)) offset = offset + #n return out end

    n = code:sub(offset):match("^%-?[0-9]+%.[0-9]+")
    if n then local out = tonumber(code:sub(offset, offset + #n-1)) offset = offset + #n return out end

    if a then local out = tonumber(code:sub(offset, offset + #a-1)) offset = offset + #a return out end

end

local function parseString() -- very strong shit
    if code:sub(offset,offset) ~= "\"" then return end

    offset = offset + 1

    local out = ""

    while true do

        local char1 = code:sub(offset, offset)
        local char2 = code:sub(offset+1, offset+1)

        if char1 == "\\" then
            if char2 == "\"" then
                out = out .. "\""
                offset = offset + 2
            elseif char2 == "\\" then
                out = out .. "\\"
                offset = offset + 2
            elseif char2 == "/" then
                out = out .. "/"
                offset = offset + 2
            elseif char2 == "b" then
                out = out .. "\b"
                offset = offset + 2
            elseif char2 == "f" then
                out = out .. "\f"
                offset = offset + 2
            elseif char2 == "n" then
                out = out .. "\n"
                offset = offset + 2
            elseif char2 == "r" then
                out = out .. "\r"
                offset = offset + 2
            elseif char2 == "t" then
                out = out .. "\t"
                offset = offset + 2
            elseif char2 == "u" then
                local hex = code:sub(offset+2, offset+5)
                out = out .. utfToBytes(hex)

                offset = offset + 6
            end
        elseif char1 == "\"" then
            offset = offset + 1
            break
        else
            out = out .. char1
            offset = offset + 1
        end

    end
    
    return out
end

local parseArray, parseObject

local function parseValue()
    skipWhiteSpace()
    EOFCheck()

    local str = parseString()
    if str then return str end

    local num = parseNumber()
    if num then return num end

    local arr = parseArray()
    if arr then return arr end

    local obj = parseObject()
    if obj then return obj end

    if code:sub(offset, offset+3) == "true" then offset = offset + 4 return true end
    if code:sub(offset, offset+4) == "false" then offset = offset + 5 return false end
    if code:sub(offset, offset+3) == "null" then offset = offset + 4 return nil end
end

function parseArray()
    if code:sub(offset,offset) ~= "[" then return end

    offset = offset + 1

    local out = {}

    while true do
        out[#out+1] = parseValue()

        skipWhiteSpace()

        if code:sub(offset,offset) == "]" then
            offset = offset + 1
            break
        else
            offset = offset + 1 -- skip ,
            EOFCheck()
        end
    end

    return  out
end

function parseObject()
    if code:sub(offset,offset) ~= "{" then return end

    offset = offset + 1

    local out = {}

    while true do

        skipWhiteSpace()

        if code:sub(offset,offset) == "}" then
            offset = offset + 1
            break
        elseif code:sub(offset, offset) == "," then
            offset = offset + 1
        end

        skipWhiteSpace()

        local key = parseString()

        skipWhiteSpace()

        offset = offset + 1 -- skip ":"

        out[key] = parseValue()

    end

    return out
end

local function hasHash(tbl) if #tbl ~= 0 then return next(tbl, #tbl) ~= nil end return true end
local function nextEnd(tbl, key) return next(tbl, key) == nil end
local function dupeTab(num) return string.rep("    ", num) end

local function jsonToString(str) --только посмейте попутать с toJson()
    local out = "\""
    for i = 1, #str do
        local char = str:sub(i,i)
        if char == "\\" then
            out = out .. "\\\\"
        elseif char == "\"" then
            out = out .. "\\\""
        elseif char == "\n" then
            out = out .. "\\n"
        elseif char == "\t" then
            out = out .. "\\t"
        elseif char == "\r" then
            out = out .. "\\r"
        else
            out = out .. char
        end
    end
    return out .. "\""
end

local min_ -- yes.

local function formatValueWithKey(key, value, deep, type, isEnd)
    local out = ""
    if type == "number" then
        out = out .. jsonToString(tostring(key)) .. (min_ and ": " or ":") .. tostring(value)
    elseif type == "string" then
        out = out .. jsonToString(tostring(key)) .. (min_ and ": " or ":") .. jsonToString(value)
    elseif type == "boolean" then
        out = out .. jsonToString(tostring(key)) .. (min_ and ": " or ":") .. tostring(value)
    elseif type == "nil" then
        out = out .. jsonToString(tostring(key)) .. (min_ and ": " or ":") .. "null"
    end
    return out .. (isEnd and "" or ",")
end

local function formatValueWithoutKey(value, deep, type, isEnd)
    local out = ""
    if type == "number" then
        out = out .. tostring(value)
    elseif type == "string" then
        out = out .. jsonToString(value)
    elseif type == "boolean" then
        out = out .. tostring(value)
    elseif type == "nil" then
        out = out .. jsonToString(tostring(key)) .. "null"
    end
    return out .. (isEnd and "" or ",")
end

local function recursive(tbl, deep, forciblyHash, isEndTBL) -- если будет родительская таблца в таблице, то... земля пухом
    print(hasHash(tbl))
    if hasHash(tbl) or forciblyHash then
        local out = "{"

        deep = deep + 1

        for key, value in pairs(tbl) do
            local type, isEnd = type(value), nextEnd(tbl, key)

            if type == "table" then
                if min_ then out = out .. "\n" .. dupeTab(deep) end
                out = out .. jsonToString(tostring(key)) .. (min_ and ": " or ":") .. recursive(value, deep, forciblyHash, isEnd)
            else
                if min_ then out = out .. "\n" .. dupeTab(deep) end
                out = out .. formatValueWithKey(key, value, deep, type, isEnd)
            end
        end

        if (next(tbl)) and min_ then out = out .. "\n" .. dupeTab(deep-1) end

        return out .. "}" .. (isEndTBL and "" or ",")
    else
        local out = "["

        deep = deep + 1

        for _, value in ipairs(tbl) do
            local type, isEnd = type(value), nextEnd(tbl, _)

            if type == "table" then
                if min_ then out = out .. "\n" .. dupeTab(deep) end
                out = out .. recursive(value, deep, nil, isEnd)
            else
                if min_ then out = out .. "\n" .. dupeTab(deep) end
                out = out .. formatValueWithoutKey(value, deep, type, isEnd)
            end
        end

        if (next(tbl)) and min_ then out = out .. "\n" .. dupeTab(deep-1) end

        return out .. "]" .. (isEndTBL and "" or ",")
    end
end

---------------------------------

local function toTable(stringJson)
    offset = 1
    code = stringJson
    len = #code
    return parseValue()
end

local function toJson(tbl, min, forciblyHash)
    min_ = not min --fucking yes
    return recursive(tbl, 0, forciblyHash, true)
end

---------------------------------

return {
    toTable = toTable,
    toJson = toJson
}