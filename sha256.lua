require"bit"

local const = {
    0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5,
    0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174,
    0xE49B69C1, 0xEFBE4786, 0x0FC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
    0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x06CA6351, 0x14292967,
    0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85,
    0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
    0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3,
    0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2
}

local char = string.char
local floor = floor
local bor = bit.bor
local lshift = bit.lshift
local bxor = bit.bxor
local ror = bit.ror
local band = bit.band
local bnot = bit.bnot
local rshift = bit.rshift
local tobit = bit.tobit
local floor = math.floor

local function toBytes(num)
    local out = ""
    for i = 0, 3 do
        out = char(band(num, 255)) .. out
        num = rshift(num, 8)
    end
    return out
end

--max data size 2^53-1
return function(data)

    local h0 = 0x6A09E667
    local h1 = 0xBB67AE85
    local h2 = 0x3C6EF372
    local h3 = 0xA54FF53A
    local h4 = 0x510E527F
    local h5 = 0x9B05688C
    local h6 = 0x1F83D9AB
    local h7 = 0x5BE0CD19

    local datalen = #data
    local len = ""

    len = char((datalen % 32)*8) .. len
    datalen = floor(datalen / 32)

    for i = 0, 6 do
        local mod = datalen % 256
        len = char(mod) .. len
        datalen = floor(datalen / 256)
    end

    data = data .. "\128" .. string.rep("\0", 64 - ((#data + 9) % 64)) .. len

    for i = 1, math.ceil(#data / 64) * 64, 64 do
        local chunk = {
            bor(bor(bor(lshift(data:sub(i,i):byte(), 24),       lshift(data:sub(i+1,i+1):byte(), 16)),   lshift(data:sub(i+2,i+2):byte(), 8)),   data:sub(i+3,i+3):byte()),
            bor(bor(bor(lshift(data:sub(i+4,i+4):byte(), 24),   lshift(data:sub(i+5,i+5):byte(), 16)),   lshift(data:sub(i+6,i+6):byte(), 8)),   data:sub(i+7,i+7):byte()),
            bor(bor(bor(lshift(data:sub(i+8,i+8):byte(), 24),   lshift(data:sub(i+9,i+9):byte(), 16)),   lshift(data:sub(i+10,i+10):byte(), 8)), data:sub(i+11,i+11):byte()),
            bor(bor(bor(lshift(data:sub(i+12,i+12):byte(), 24), lshift(data:sub(i+13,i+13):byte(), 16)), lshift(data:sub(i+14,i+14):byte(), 8)), data:sub(i+15,i+15):byte()),
            bor(bor(bor(lshift(data:sub(i+16,i+16):byte(), 24), lshift(data:sub(i+17,i+17):byte(), 16)), lshift(data:sub(i+18,i+18):byte(), 8)), data:sub(i+19,i+19):byte()),
            bor(bor(bor(lshift(data:sub(i+20,i+20):byte(), 24), lshift(data:sub(i+21,i+21):byte(), 16)), lshift(data:sub(i+22,i+22):byte(), 8)), data:sub(i+23,i+23):byte()),
            bor(bor(bor(lshift(data:sub(i+24,i+24):byte(), 24), lshift(data:sub(i+25,i+25):byte(), 16)), lshift(data:sub(i+26,i+26):byte(), 8)), data:sub(i+27,i+27):byte()),
            bor(bor(bor(lshift(data:sub(i+28,i+28):byte(), 24), lshift(data:sub(i+29,i+29):byte(), 16)), lshift(data:sub(i+30,i+30):byte(), 8)), data:sub(i+31,i+31):byte()),
            bor(bor(bor(lshift(data:sub(i+32,i+32):byte(), 24), lshift(data:sub(i+33,i+33):byte(), 16)), lshift(data:sub(i+34,i+34):byte(), 8)), data:sub(i+35,i+35):byte()),
            bor(bor(bor(lshift(data:sub(i+36,i+36):byte(), 24), lshift(data:sub(i+37,i+37):byte(), 16)), lshift(data:sub(i+38,i+38):byte(), 8)), data:sub(i+39,i+39):byte()),
            bor(bor(bor(lshift(data:sub(i+40,i+40):byte(), 24), lshift(data:sub(i+41,i+41):byte(), 16)), lshift(data:sub(i+42,i+42):byte(), 8)), data:sub(i+43,i+43):byte()),
            bor(bor(bor(lshift(data:sub(i+44,i+44):byte(), 24), lshift(data:sub(i+45,i+45):byte(), 16)), lshift(data:sub(i+46,i+46):byte(), 8)), data:sub(i+47,i+47):byte()),
            bor(bor(bor(lshift(data:sub(i+48,i+48):byte(), 24), lshift(data:sub(i+49,i+49):byte(), 16)), lshift(data:sub(i+50,i+50):byte(), 8)), data:sub(i+51,i+51):byte()),
            bor(bor(bor(lshift(data:sub(i+52,i+52):byte(), 24), lshift(data:sub(i+53,i+53):byte(), 16)), lshift(data:sub(i+54,i+54):byte(), 8)), data:sub(i+55,i+55):byte()),
            bor(bor(bor(lshift(data:sub(i+56,i+56):byte(), 24), lshift(data:sub(i+57,i+57):byte(), 16)), lshift(data:sub(i+58,i+58):byte(), 8)), data:sub(i+59,i+59):byte()),
            bor(bor(bor(lshift(data:sub(i+60,i+60):byte(), 24), lshift(data:sub(i+61,i+61):byte(), 16)), lshift(data:sub(i+62,i+62):byte(), 8)), data:sub(i+63,i+63):byte())
        }

        for i = 17, 64 do
            local s0 = bxor(bxor(ror(chunk[i-15], 7), ror(chunk[i-15], 18)), rshift(chunk[i-15], 3))
            local s1 = bxor(bxor(ror(chunk[i-2], 17), ror(chunk[i-2], 19)), rshift(chunk[i-2], 10))
            chunk[i] = tobit(chunk[i-16] + s0 + chunk[i-7] + s1)
        end

        local a = h0
        local b = h1
        local c = h2
        local d = h3
        local e = h4
        local f = h5
        local g = h6
        local h = h7

        for i = 1, 64 do
            local Z0 = bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22))
            local Ma = bxor(bxor(band(a, b), band(a, c)), band(b, c))
            local t2 = tobit(Z0 + Ma)
            local Z1 = bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25))
            local Ch = bxor(band(e, f), band(bnot(e), g))
            local t1 = tobit(h + Z1 + Ch + const[i] + chunk[i])

            h = g
            g = f
            f = e
            e = tobit(d + t1)
            d = c
            c = b
            b = a
            a = tobit(t1 + t2)
        end

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