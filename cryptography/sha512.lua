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
local band = bit.band
local bnot = bit.bnot
local rshift = bit.rshift
local tobit = bit.tobit

local function toBytes32(num)
    local out = ""
    for i = 0, 3 do
        out = char(band(num, 255)) .. out
        num = rshift(num, 8)
    end
    return out
end

local function overflowbit32(L, R)
    if L < 0 then L = L + 4294967296 end
    if R < 0 then R = R + 4294967296 end
    if (L + R) > 4294967295 then return 1 end
    return 0
end

local function not64(L, R) return bnot(L), bnot(R) end
local function rotl64(L, R) return bor(rshift(R, 32-n), lshift(L, n)), bor(lshift(R, n), rshift(L, 32-n)) end
local function rotr64(L, R, n) return bor(lshift(R, 32-n), rshift(L, n)), bor(rshift(R, n), lshift(L, 32-n)) end
local function shiftr64(L, R, n) return rshift(L, n), bor(lshift(R, n), rshift(L, 32-n)) end
local function add64(L0, R0, L1, R1) return tobit(L0 + L1 + overflowbit32(R0, R1)), tobit(R0 + R1) end
local function and64(L0, R0, L1, R1) return band(L0, L1), band(R0, R1) end
local function xor64(L0, R0, L1, R1) return bxor(L0, L1), bxor(R0, R1) end

local function sha512(data)

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

    local chunkL, chunkR = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

    local tempL, tempR = 0, 0

    local AL, AR = 0, 0
    local BL, BR = 0, 0
    local CL, CR = 0, 0
    local DL, DR = 0, 0
    local EL, ER = 0, 0
    local FL, FR = 0, 0
    local GL, GR = 0, 0
    local HL, HR = 0, 0

    for i = 1, #data, 128 do
        
        chunkL[1], chunkR[1] = bor(bor(bor(lshift(data:sub(i,i):byte(), 24), lshift(data:sub(i+1,i+1):byte(), 16)), lshift(data:sub(i+2,i+2):byte(), 8)), data:sub(i+3,i+3):byte()), bor(bor(bor(lshift(data:sub(i+4,i+4):byte(), 24), lshift(data:sub(i+5,i+5):byte(), 16)), lshift(data:sub(i+6,i+6):byte(), 8)), data:sub(i+7,i+7):byte())
        chunkL[2], chunkR[2] = bor(bor(bor(lshift(data:sub(i+8,i+8):byte(), 24), lshift(data:sub(i+9,i+9):byte(), 16)), lshift(data:sub(i+10,i+10):byte(), 8)), data:sub(i+11,i+11):byte()), bor(bor(bor(lshift(data:sub(i+12,i+12):byte(), 24), lshift(data:sub(i+13,i+13):byte(), 16)), lshift(data:sub(i+14,i+14):byte(), 8)), data:sub(i+15,i+15):byte())
        chunkL[3], chunkR[3] = bor(bor(bor(lshift(data:sub(i+16,i+16):byte(), 24), lshift(data:sub(i+17,i+17):byte(), 16)), lshift(data:sub(i+18,i+18):byte(), 8)), data:sub(i+19,i+19):byte()), bor(bor(bor(lshift(data:sub(i+20,i+20):byte(), 24), lshift(data:sub(i+21,i+21):byte(), 16)), lshift(data:sub(i+22,i+22):byte(), 8)), data:sub(i+23,i+23):byte())
        chunkL[4], chunkR[4] = bor(bor(bor(lshift(data:sub(i+24,i+24):byte(), 24), lshift(data:sub(i+25,i+25):byte(), 16)), lshift(data:sub(i+26,i+26):byte(), 8)), data:sub(i+27,i+27):byte()), bor(bor(bor(lshift(data:sub(i+28,i+28):byte(), 24), lshift(data:sub(i+29,i+29):byte(), 16)), lshift(data:sub(i+30,i+30):byte(), 8)), data:sub(i+31,i+31):byte())
        chunkL[5], chunkR[5] = bor(bor(bor(lshift(data:sub(i+32,i+32):byte(), 24), lshift(data:sub(i+33,i+33):byte(), 16)), lshift(data:sub(i+34,i+34):byte(), 8)), data:sub(i+35,i+35):byte()), bor(bor(bor(lshift(data:sub(i+36,i+36):byte(), 24), lshift(data:sub(i+37,i+37):byte(), 16)), lshift(data:sub(i+38,i+38):byte(), 8)), data:sub(i+39,i+39):byte())
        chunkL[6], chunkR[6] = bor(bor(bor(lshift(data:sub(i+40,i+40):byte(), 24), lshift(data:sub(i+41,i+41):byte(), 16)), lshift(data:sub(i+42,i+42):byte(), 8)), data:sub(i+43,i+43):byte()), bor(bor(bor(lshift(data:sub(i+44,i+44):byte(), 24), lshift(data:sub(i+45,i+45):byte(), 16)), lshift(data:sub(i+46,i+46):byte(), 8)), data:sub(i+47,i+47):byte())
        chunkL[7], chunkR[7] = bor(bor(bor(lshift(data:sub(i+48,i+48):byte(), 24), lshift(data:sub(i+49,i+49):byte(), 16)), lshift(data:sub(i+50,i+50):byte(), 8)), data:sub(i+51,i+51):byte()), bor(bor(bor(lshift(data:sub(i+52,i+52):byte(), 24), lshift(data:sub(i+53,i+53):byte(), 16)), lshift(data:sub(i+54,i+54):byte(), 8)), data:sub(i+55,i+55):byte())
        chunkL[8], chunkR[8] = bor(bor(bor(lshift(data:sub(i+56,i+56):byte(), 24), lshift(data:sub(i+57,i+57):byte(), 16)), lshift(data:sub(i+58,i+58):byte(), 8)), data:sub(i+59,i+59):byte()), bor(bor(bor(lshift(data:sub(i+60,i+60):byte(), 24), lshift(data:sub(i+61,i+61):byte(), 16)), lshift(data:sub(i+62,i+62):byte(), 8)), data:sub(i+63,i+63):byte())
        chunkL[9], chunkR[9] = bor(bor(bor(lshift(data:sub(i+64,i+64):byte(), 24), lshift(data:sub(i+65,i+65):byte(), 16)), lshift(data:sub(i+66,i+66):byte(), 8)), data:sub(i+67,i+67):byte()), bor(bor(bor(lshift(data:sub(i+68,i+68):byte(), 24), lshift(data:sub(i+69,i+69):byte(), 16)), lshift(data:sub(i+70,i+70):byte(), 8)), data:sub(i+71,i+71):byte())
        chunkL[10], chunkR[10] = bor(bor(bor(lshift(data:sub(i+72,i+72):byte(), 24), lshift(data:sub(i+73,i+73):byte(), 16)), lshift(data:sub(i+74,i+74):byte(), 8)), data:sub(i+75,i+75):byte()), bor(bor(bor(lshift(data:sub(i+76,i+76):byte(), 24), lshift(data:sub(i+77,i+77):byte(), 16)), lshift(data:sub(i+78,i+78):byte(), 8)), data:sub(i+79,i+79):byte())
        chunkL[11], chunkR[11] = bor(bor(bor(lshift(data:sub(i+80,i+80):byte(), 24), lshift(data:sub(i+81,i+81):byte(), 16)), lshift(data:sub(i+82,i+82):byte(), 8)), data:sub(i+83,i+83):byte()), bor(bor(bor(lshift(data:sub(i+84,i+84):byte(), 24), lshift(data:sub(i+85,i+85):byte(), 16)), lshift(data:sub(i+86,i+86):byte(), 8)), data:sub(i+87,i+87):byte())
        chunkL[12], chunkR[12] = bor(bor(bor(lshift(data:sub(i+88,i+88):byte(), 24), lshift(data:sub(i+89,i+89):byte(), 16)), lshift(data:sub(i+90,i+90):byte(), 8)), data:sub(i+91,i+91):byte()), bor(bor(bor(lshift(data:sub(i+92,i+92):byte(), 24), lshift(data:sub(i+93,i+93):byte(), 16)), lshift(data:sub(i+94,i+94):byte(), 8)), data:sub(i+95,i+95):byte())
        chunkL[13], chunkR[13] = bor(bor(bor(lshift(data:sub(i+96,i+96):byte(), 24), lshift(data:sub(i+97,i+97):byte(), 16)), lshift(data:sub(i+98,i+98):byte(), 8)), data:sub(i+99,i+99):byte()), bor(bor(bor(lshift(data:sub(i+100,i+100):byte(), 24), lshift(data:sub(i+101,i+101):byte(), 16)), lshift(data:sub(i+102,i+102):byte(), 8)), data:sub(i+103,i+103):byte())
        chunkL[14], chunkR[14] = bor(bor(bor(lshift(data:sub(i+104,i+104):byte(), 24), lshift(data:sub(i+105,i+105):byte(), 16)), lshift(data:sub(i+106,i+106):byte(), 8)), data:sub(i+107,i+107):byte()), bor(bor(bor(lshift(data:sub(i+108,i+108):byte(), 24), lshift(data:sub(i+109,i+109):byte(), 16)), lshift(data:sub(i+110,i+110):byte(), 8)), data:sub(i+111,i+111):byte())
        chunkL[15], chunkR[15] = bor(bor(bor(lshift(data:sub(i+112,i+112):byte(), 24), lshift(data:sub(i+113,i+113):byte(), 16)), lshift(data:sub(i+114,i+114):byte(), 8)), data:sub(i+115,i+115):byte()), bor(bor(bor(lshift(data:sub(i+116,i+116):byte(), 24), lshift(data:sub(i+117,i+117):byte(), 16)), lshift(data:sub(i+118,i+118):byte(), 8)), data:sub(i+119,i+119):byte())
        chunkL[16], chunkR[16] = bor(bor(bor(lshift(data:sub(i+120,i+120):byte(), 24), lshift(data:sub(i+121,i+121):byte(), 16)), lshift(data:sub(i+122,i+122):byte(), 8)), data:sub(i+123,i+123):byte()), bor(bor(bor(lshift(data:sub(i+124,i+124):byte(), 24), lshift(data:sub(i+125,i+125):byte(), 16)), lshift(data:sub(i+126,i+126):byte(), 8)), data:sub(i+127,i+127):byte())
        
        


        
    end
    
    
end

sha512("113221323")