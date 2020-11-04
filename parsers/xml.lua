--[[ юзать исключительно для парсинга xml файлов из API ]]
--[[ а также он ужасно не оптимизирован :) ]]

local code = ""
local offset = 1

local function utf_code_to_bytes(code)
    if code < 0x80 then
        return string.char(code)
    elseif code < 0x800 then
        return string.char(192 + bit.rshift(code, 6)) .. string.char(128 + bit.band(code, 63))
    elseif code < 0x10000 then
        return string.char(224 + bit.rshift(code, 12)) .. string.char(128 + bit.band(bit.rshift(code, 6), 63)) .. string.char(128 + bit.band(code, 63))
    end
end

local function whitespace_length()
    local result = code:sub(offset):match("^[\n\t\r ]*")
    if result then return #result end
    return 0
end

local function parse_word()
    local result = code:sub(offset):match("^[0-9a-zA-Z_]+")
    if result then return result end
    return ""
end

local function parse_comment_lenght()
    if code:sub(offset, offset+3) == "<!--" then
        local len = 0
        while true do if code:sub(offset + len, offset+2 + len) == "-->" then return len else len = len + 1 end end
    else return 0 end
end

local function parse_prefix_tag()
    if code:sub(offset, offset + 8) == "<![CDATA[" then return end
    if code:sub(offset, offset) == "<" then
        offset = offset + 1

        if code:sub(offset, offset) == "?" then offset = offset + 1 end

        local self_close = false
        local name = parse_word()
        offset = offset + #name

        local attributes = {}

        while true do
            offset = offset + whitespace_length()
            if code:sub(offset, offset) == ">" then offset = offset + 1 break end

            local prefix = code:sub(offset, offset+1)
            if prefix == "?>" then offset = offset + 2 self_close = true break end
            if prefix == "/>" then offset = offset + 2 self_close = true break end

            local attribute_name = parse_word()
            offset = offset + #attribute_name
            offset = offset + whitespace_length()
            offset = offset + 1
            offset = offset + whitespace_length()
            local str_prefix = code:sub(offset, offset)
            offset = offset + 1
            local attribute_value = code:sub(offset):match("^[^"..str_prefix.."]*")
            offset = offset + #attribute_value
            offset = offset + 1

            attributes[attribute_name] = attribute_value

        end

        return { ["name"] = name, ["attributes"] = attributes , ["self_close"] = self_close}
    end
end

local function parse_body()
    local out = ""
    local len = 0

    if code:sub(offset, offset + 8) == "<![CDATA[" then
        while true do
            if code:sub(offset + len, offset + len + 2) == "]]>" then len = len + 3 break end
            out = out .. code:sub(offset + len, offset + len)
            len = len + 1
        end
        return out:sub(10), len
    end

    while true do

        local replaced = false

        local end_ = code:sub(offset + len, offset + len + 1)
        if end_ == "</" then break end

        end_ = code:sub(offset + len, offset + len)
        if end_ == "<" or end_ == ">" then return nil, nil end

        local special_4 = code:sub(offset + len, offset + len + 3)

        if special_4 == "&lt;" then out = out .. "<" len = len + 4 replaced = true
        elseif special_4 == "&gt;" then out = out .. ">" len = len + 4 replaced = true
        end

        if not replaced then
            local special_5 = code:sub(offset + len, offset + len + 4)

            if special_5 == "&amp;" then out = out .. "&" len = len + 5 replaced = true
            elseif special_5 == "&apos;" then out = out .. "\'" len = len + 5 replaced = true
            elseif special_5 == "&quot;" then out = out .. "\"" len = len + 5 replaced = true
            end
        end

        if not replaced then
            local codepoint = code:sub(offset + len):match("^&#[0-9]+;")
            if codepoint then
                out = out .. utf_code_to_bytes(tonumber(codepoint:sub(3,-2)))
                len = len + #codepoint
                replaced = true
            end
        end

        if not replaced then
            local codepoint = code:sub(offset + len):match("^&#[xX][0-9a-fA-F]+;")
            if codepoint then
                out = out .. utf_code_to_bytes(tonumber(codepoint:sub(4,-2), 16))
                len = len + #codepoint
                replaced = true
            end
        end

        if not replaced then
            out = out .. code:sub(offset + len, offset + len)
            len = len + 1
        end
    end

    local trim_right = 1

    while true do
        local char = code:sub(offset + len - trim_right, offset + len - trim_right)
        if char == "\n" or char == "\t" or char == " " or char == "\r" then trim_right = trim_right + 1 else break end
    end

    return out:sub(1, -trim_right), len
end

local function parse_tag()

    offset = offset + whitespace_length()

    local temp_offset = offset
    local prefix = parse_prefix_tag()
    local temp_offset1 = offset

    offset = temp_offset
    local body, len = parse_body()

    if body then
        return body, len
    end

    offset = temp_offset1

    if prefix.self_close then return {name = prefix.name, attributes = prefix.attributes} end

    local body = {}
    local suffix = "</" .. prefix.name .. ">"

    while true do
        offset = offset + whitespace_length()

        if code:sub(offset, offset + #suffix-1) == suffix then
            offset = offset + #suffix
            break
        end

        local tag_or_body, len = parse_tag()

        if type(tag_or_body) == "string" then offset = offset + len + #suffix return {name = prefix.name, attributes = prefix.attributes, body = tag_or_body} end
        body[#body+1] = tag_or_body

        offset = offset + whitespace_length()
    end

    if #body == 0 then return {name = prefix.name, attributes = prefix.attributes, body = ""} end

    return {name = prefix.name, attributes = prefix.attributes, body = body}
end

return function(str)
    code = str
    offset = 1

    local body = {}

    while true do
        offset = offset + whitespace_length()

        if code:sub(offset, offset) == "" then break end

        body[#body+1] = parse_tag()
    end

    return body
end