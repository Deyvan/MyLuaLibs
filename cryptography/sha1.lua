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
local rol = bit.rol
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

    data = data .. "\128" .. string.rep("\0", 64 - ((#data + 9) % 64)) .. len

    local h0 = 0x67452301
    local h1 = 0xefcdab89
    local h2 = 0x98badcfe
    local h3 = 0x10325476
    local h4 = 0xc3d2e1f0

    for i = 1, #data, 64 do
        local chunk_1 = bor(bor(bor(lshift(data:sub(i+0,i+0):byte(), 24),lshift(data:sub(i+1,i+1):byte(), 16)),lshift(data:sub(i+2,i+2):byte(), 8)),data:sub(i+3,i+3):byte())
        local chunk_2 = bor(bor(bor(lshift(data:sub(i+4,i+4):byte(), 24),lshift(data:sub(i+5,i+5):byte(), 16)),lshift(data:sub(i+6,i+6):byte(), 8)),data:sub(i+7,i+7):byte())
        local chunk_3 = bor(bor(bor(lshift(data:sub(i+8,i+8):byte(), 24),lshift(data:sub(i+9,i+9):byte(), 16)),lshift(data:sub(i+10,i+10):byte(), 8)),data:sub(i+11,i+11):byte())
        local chunk_4 = bor(bor(bor(lshift(data:sub(i+12,i+12):byte(), 24),lshift(data:sub(i+13,i+13):byte(), 16)),lshift(data:sub(i+14,i+14):byte(), 8)),data:sub(i+15,i+15):byte())
        local chunk_5 = bor(bor(bor(lshift(data:sub(i+16,i+16):byte(), 24),lshift(data:sub(i+17,i+17):byte(), 16)),lshift(data:sub(i+18,i+18):byte(), 8)),data:sub(i+19,i+19):byte())
        local chunk_6 = bor(bor(bor(lshift(data:sub(i+20,i+20):byte(), 24),lshift(data:sub(i+21,i+21):byte(), 16)),lshift(data:sub(i+22,i+22):byte(), 8)),data:sub(i+23,i+23):byte())
        local chunk_7 = bor(bor(bor(lshift(data:sub(i+24,i+24):byte(), 24),lshift(data:sub(i+25,i+25):byte(), 16)),lshift(data:sub(i+26,i+26):byte(), 8)),data:sub(i+27,i+27):byte())
        local chunk_8 = bor(bor(bor(lshift(data:sub(i+28,i+28):byte(), 24),lshift(data:sub(i+29,i+29):byte(), 16)),lshift(data:sub(i+30,i+30):byte(), 8)),data:sub(i+31,i+31):byte())
        local chunk_9 = bor(bor(bor(lshift(data:sub(i+32,i+32):byte(), 24),lshift(data:sub(i+33,i+33):byte(), 16)),lshift(data:sub(i+34,i+34):byte(), 8)),data:sub(i+35,i+35):byte())
        local chunk_10 = bor(bor(bor(lshift(data:sub(i+36,i+36):byte(), 24),lshift(data:sub(i+37,i+37):byte(), 16)),lshift(data:sub(i+38,i+38):byte(), 8)),data:sub(i+39,i+39):byte())
        local chunk_11 = bor(bor(bor(lshift(data:sub(i+40,i+40):byte(), 24),lshift(data:sub(i+41,i+41):byte(), 16)),lshift(data:sub(i+42,i+42):byte(), 8)),data:sub(i+43,i+43):byte())
        local chunk_12 = bor(bor(bor(lshift(data:sub(i+44,i+44):byte(), 24),lshift(data:sub(i+45,i+45):byte(), 16)),lshift(data:sub(i+46,i+46):byte(), 8)),data:sub(i+47,i+47):byte())
        local chunk_13 = bor(bor(bor(lshift(data:sub(i+48,i+48):byte(), 24),lshift(data:sub(i+49,i+49):byte(), 16)),lshift(data:sub(i+50,i+50):byte(), 8)),data:sub(i+51,i+51):byte())
        local chunk_14 = bor(bor(bor(lshift(data:sub(i+52,i+52):byte(), 24),lshift(data:sub(i+53,i+53):byte(), 16)),lshift(data:sub(i+54,i+54):byte(), 8)),data:sub(i+55,i+55):byte())
        local chunk_15 = bor(bor(bor(lshift(data:sub(i+56,i+56):byte(), 24),lshift(data:sub(i+57,i+57):byte(), 16)),lshift(data:sub(i+58,i+58):byte(), 8)),data:sub(i+59,i+59):byte())
        local chunk_16 = bor(bor(bor(lshift(data:sub(i+60,i+60):byte(), 24),lshift(data:sub(i+61,i+61):byte(), 16)),lshift(data:sub(i+62,i+62):byte(), 8)),data:sub(i+63,i+63):byte())
        local chunk_17 = rol(bxor(chunk_14, bxor(chunk_9, bxor(chunk_3, chunk_1))), 1)
        local chunk_18 = rol(bxor(chunk_15, bxor(chunk_10, bxor(chunk_4, chunk_2))), 1)
        local chunk_19 = rol(bxor(chunk_16, bxor(chunk_11, bxor(chunk_5, chunk_3))), 1)
        local chunk_20 = rol(bxor(chunk_17, bxor(chunk_12, bxor(chunk_6, chunk_4))), 1)
        local chunk_21 = rol(bxor(chunk_18, bxor(chunk_13, bxor(chunk_7, chunk_5))), 1)
        local chunk_22 = rol(bxor(chunk_19, bxor(chunk_14, bxor(chunk_8, chunk_6))), 1)
        local chunk_23 = rol(bxor(chunk_20, bxor(chunk_15, bxor(chunk_9, chunk_7))), 1)
        local chunk_24 = rol(bxor(chunk_21, bxor(chunk_16, bxor(chunk_10, chunk_8))), 1)
        local chunk_25 = rol(bxor(chunk_22, bxor(chunk_17, bxor(chunk_11, chunk_9))), 1)
        local chunk_26 = rol(bxor(chunk_23, bxor(chunk_18, bxor(chunk_12, chunk_10))), 1)
        local chunk_27 = rol(bxor(chunk_24, bxor(chunk_19, bxor(chunk_13, chunk_11))), 1)
        local chunk_28 = rol(bxor(chunk_25, bxor(chunk_20, bxor(chunk_14, chunk_12))), 1)
        local chunk_29 = rol(bxor(chunk_26, bxor(chunk_21, bxor(chunk_15, chunk_13))), 1)
        local chunk_30 = rol(bxor(chunk_27, bxor(chunk_22, bxor(chunk_16, chunk_14))), 1)
        local chunk_31 = rol(bxor(chunk_28, bxor(chunk_23, bxor(chunk_17, chunk_15))), 1)
        local chunk_32 = rol(bxor(chunk_29, bxor(chunk_24, bxor(chunk_18, chunk_16))), 1)
        local chunk_33 = rol(bxor(chunk_30, bxor(chunk_25, bxor(chunk_19, chunk_17))), 1)
        local chunk_34 = rol(bxor(chunk_31, bxor(chunk_26, bxor(chunk_20, chunk_18))), 1)
        local chunk_35 = rol(bxor(chunk_32, bxor(chunk_27, bxor(chunk_21, chunk_19))), 1)
        local chunk_36 = rol(bxor(chunk_33, bxor(chunk_28, bxor(chunk_22, chunk_20))), 1)
        local chunk_37 = rol(bxor(chunk_34, bxor(chunk_29, bxor(chunk_23, chunk_21))), 1)
        local chunk_38 = rol(bxor(chunk_35, bxor(chunk_30, bxor(chunk_24, chunk_22))), 1)
        local chunk_39 = rol(bxor(chunk_36, bxor(chunk_31, bxor(chunk_25, chunk_23))), 1)
        local chunk_40 = rol(bxor(chunk_37, bxor(chunk_32, bxor(chunk_26, chunk_24))), 1)
        local chunk_41 = rol(bxor(chunk_38, bxor(chunk_33, bxor(chunk_27, chunk_25))), 1)
        local chunk_42 = rol(bxor(chunk_39, bxor(chunk_34, bxor(chunk_28, chunk_26))), 1)
        local chunk_43 = rol(bxor(chunk_40, bxor(chunk_35, bxor(chunk_29, chunk_27))), 1)
        local chunk_44 = rol(bxor(chunk_41, bxor(chunk_36, bxor(chunk_30, chunk_28))), 1)
        local chunk_45 = rol(bxor(chunk_42, bxor(chunk_37, bxor(chunk_31, chunk_29))), 1)
        local chunk_46 = rol(bxor(chunk_43, bxor(chunk_38, bxor(chunk_32, chunk_30))), 1)
        local chunk_47 = rol(bxor(chunk_44, bxor(chunk_39, bxor(chunk_33, chunk_31))), 1)
        local chunk_48 = rol(bxor(chunk_45, bxor(chunk_40, bxor(chunk_34, chunk_32))), 1)
        local chunk_49 = rol(bxor(chunk_46, bxor(chunk_41, bxor(chunk_35, chunk_33))), 1)
        local chunk_50 = rol(bxor(chunk_47, bxor(chunk_42, bxor(chunk_36, chunk_34))), 1)
        local chunk_51 = rol(bxor(chunk_48, bxor(chunk_43, bxor(chunk_37, chunk_35))), 1)
        local chunk_52 = rol(bxor(chunk_49, bxor(chunk_44, bxor(chunk_38, chunk_36))), 1)
        local chunk_53 = rol(bxor(chunk_50, bxor(chunk_45, bxor(chunk_39, chunk_37))), 1)
        local chunk_54 = rol(bxor(chunk_51, bxor(chunk_46, bxor(chunk_40, chunk_38))), 1)
        local chunk_55 = rol(bxor(chunk_52, bxor(chunk_47, bxor(chunk_41, chunk_39))), 1)
        local chunk_56 = rol(bxor(chunk_53, bxor(chunk_48, bxor(chunk_42, chunk_40))), 1)
        local chunk_57 = rol(bxor(chunk_54, bxor(chunk_49, bxor(chunk_43, chunk_41))), 1)
        local chunk_58 = rol(bxor(chunk_55, bxor(chunk_50, bxor(chunk_44, chunk_42))), 1)
        local chunk_59 = rol(bxor(chunk_56, bxor(chunk_51, bxor(chunk_45, chunk_43))), 1)
        local chunk_60 = rol(bxor(chunk_57, bxor(chunk_52, bxor(chunk_46, chunk_44))), 1)
        local chunk_61 = rol(bxor(chunk_58, bxor(chunk_53, bxor(chunk_47, chunk_45))), 1)
        local chunk_62 = rol(bxor(chunk_59, bxor(chunk_54, bxor(chunk_48, chunk_46))), 1)
        local chunk_63 = rol(bxor(chunk_60, bxor(chunk_55, bxor(chunk_49, chunk_47))), 1)
        local chunk_64 = rol(bxor(chunk_61, bxor(chunk_56, bxor(chunk_50, chunk_48))), 1)
        local chunk_65 = rol(bxor(chunk_62, bxor(chunk_57, bxor(chunk_51, chunk_49))), 1)
        local chunk_66 = rol(bxor(chunk_63, bxor(chunk_58, bxor(chunk_52, chunk_50))), 1)
        local chunk_67 = rol(bxor(chunk_64, bxor(chunk_59, bxor(chunk_53, chunk_51))), 1)
        local chunk_68 = rol(bxor(chunk_65, bxor(chunk_60, bxor(chunk_54, chunk_52))), 1)
        local chunk_69 = rol(bxor(chunk_66, bxor(chunk_61, bxor(chunk_55, chunk_53))), 1)
        local chunk_70 = rol(bxor(chunk_67, bxor(chunk_62, bxor(chunk_56, chunk_54))), 1)
        local chunk_71 = rol(bxor(chunk_68, bxor(chunk_63, bxor(chunk_57, chunk_55))), 1)
        local chunk_72 = rol(bxor(chunk_69, bxor(chunk_64, bxor(chunk_58, chunk_56))), 1)
        local chunk_73 = rol(bxor(chunk_70, bxor(chunk_65, bxor(chunk_59, chunk_57))), 1)
        local chunk_74 = rol(bxor(chunk_71, bxor(chunk_66, bxor(chunk_60, chunk_58))), 1)
        local chunk_75 = rol(bxor(chunk_72, bxor(chunk_67, bxor(chunk_61, chunk_59))), 1)
        local chunk_76 = rol(bxor(chunk_73, bxor(chunk_68, bxor(chunk_62, chunk_60))), 1)
        local chunk_77 = rol(bxor(chunk_74, bxor(chunk_69, bxor(chunk_63, chunk_61))), 1)
        local chunk_78 = rol(bxor(chunk_75, bxor(chunk_70, bxor(chunk_64, chunk_62))), 1)
        local chunk_79 = rol(bxor(chunk_76, bxor(chunk_71, bxor(chunk_65, chunk_63))), 1)
        local chunk_80 = rol(bxor(chunk_77, bxor(chunk_72, bxor(chunk_66, chunk_64))), 1)

        local a,b,c,d,e = h0, h1, h2, h3, h4

        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_1))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_2))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_3))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_4))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_5))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_6))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_7))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_8))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_9))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_10))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_11))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_12))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_13))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_14))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_15))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_16))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_17))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_18))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_19))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b,c), band(bnot(b), d)) + tobit(e + tobit(1518500249 + chunk_20))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_21))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_22))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_23))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_24))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_25))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_26))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_27))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_28))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_29))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_30))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_31))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_32))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_33))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_34))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_35))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_36))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_37))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_38))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_39))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(1859775393 + chunk_40))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_41))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_42))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_43))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_44))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_45))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_46))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_47))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_48))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_49))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_50))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_51))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_52))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_53))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_54))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_55))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_56))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_57))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_58))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_59))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(band(b, c), bxor(band(b, d), band(c, d))) + tobit(e + tobit(2400959708 + chunk_60))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_61))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_62))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_63))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_64))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_65))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_66))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_67))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_68))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_69))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_70))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_71))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_72))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_73))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_74))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_75))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_76))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_77))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_78))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_79))))
        e, d, c, b, a = d, c, rol(b, 30), a, tobit(rol(a, 5) + tobit(bxor(b, bxor(c, d)) + tobit(e + tobit(3395469782 + chunk_80)))) -- НАХУЙ FOR ЮХУУ!!!
        

        h0 = tobit(h0 + a)
        h1 = tobit(h1 + b)
        h2 = tobit(h2 + c)
        h3 = tobit(h3 + d)
        h4 = tobit(h4 + e)

    end

    return toBytes(h0) .. toBytes(h1) .. toBytes(h2) .. toBytes(h3) .. toBytes(h4)
end