local char = string.char
local floor = math.floor
local ceil = math.ceil

local bit = _G.bit or _G.bit32

if not bit then
    local status, tbl = pcall(require, "bit")
    if status then bit = tbl end

    local status, tbl = pcall(require, "bit32")
    if status then bit = tbl end
end

if not bit then error("bit library not found!") end

local bor = bit.bor
local lshift = bit.lshift
local bxor = bit.bxor
local ror = bit.ror
local band = bit.band
local bnot = bit.bnot
local rshift = bit.rshift
local tobit = bit.tobit

local function toBytes(num)
    local out = ""
    for i = 0, 3 do
        out = char(band(num, 255)) .. out
        num = rshift(num, 8)
    end
    return out
end

return function(data)

    local datalen = #data
    local len = ""

    len = char((datalen % 32)*8) .. len
    datalen = floor(datalen / 32)

    for i = 0, 6 do
        local mod = datalen % 256
        len = char(mod) .. len
        datalen = floor(datalen / 256)
    end

    data = data .. "\128" .. string.rep("\0", 128 - ((#data + 9) % 128)) .. len

    local h0H, h0L = 0x6a09e667, 0xf3bcc908
    local h1H, h1L = 0xbb67ae85, 0x84caa73b
    local h2H, h2L = 0x3c6ef372, 0xfe94f82b
    local h3H, h3L = 0xa54ff53a, 0x5f1d36f1
    local h4H, h4L = 0x510e527f, 0xade682d1
    local h5H, h5L = 0x9b05688c, 0x2b3e6c1f
    local h6H, h6L = 0x1f83d9ab, 0xfb41bd6b
    local h7H, h7L = 0x5be0cd19, 0x137e2179

    for i = 1, #data, 128 do
        

        h0 = tobit(h0 + a)
        h1 = tobit(h1 + b)
        h2 = tobit(h2 + c)
        h3 = tobit(h3 + d)
        h4 = tobit(h4 + e)
        h5 = tobit(h5 + f)
        h6 = tobit(h6 + g)
        h7 = tobit(h7 + h)
    end
    
    return toBytes(h0) .. toBytes(h1) .. toBytes(h2) .. toBytes(h3) .. toBytes(h4) .. toBytes(h5) .. toBytes(h6) .. toBytes(h7)
end
