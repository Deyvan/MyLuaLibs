require"bit"

--ради бога пожалуйста пропускайте это через minifier

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
        local chunk_1 = bor(bor(bor(lshift(data:sub(i,i):byte(), 24),       lshift(data:sub(i+1,i+1):byte(), 16)),   lshift(data:sub(i+2,i+2):byte(), 8)),   data:sub(i+3,i+3):byte())
        local chunk_2 = bor(bor(bor(lshift(data:sub(i+4,i+4):byte(), 24),   lshift(data:sub(i+5,i+5):byte(), 16)),   lshift(data:sub(i+6,i+6):byte(), 8)),   data:sub(i+7,i+7):byte())
        local chunk_3 = bor(bor(bor(lshift(data:sub(i+8,i+8):byte(), 24),   lshift(data:sub(i+9,i+9):byte(), 16)),   lshift(data:sub(i+10,i+10):byte(), 8)), data:sub(i+11,i+11):byte())
        local chunk_4 = bor(bor(bor(lshift(data:sub(i+12,i+12):byte(), 24), lshift(data:sub(i+13,i+13):byte(), 16)), lshift(data:sub(i+14,i+14):byte(), 8)), data:sub(i+15,i+15):byte())
        local chunk_5 = bor(bor(bor(lshift(data:sub(i+16,i+16):byte(), 24), lshift(data:sub(i+17,i+17):byte(), 16)), lshift(data:sub(i+18,i+18):byte(), 8)), data:sub(i+19,i+19):byte())
        local chunk_6 = bor(bor(bor(lshift(data:sub(i+20,i+20):byte(), 24), lshift(data:sub(i+21,i+21):byte(), 16)), lshift(data:sub(i+22,i+22):byte(), 8)), data:sub(i+23,i+23):byte())
        local chunk_7 = bor(bor(bor(lshift(data:sub(i+24,i+24):byte(), 24), lshift(data:sub(i+25,i+25):byte(), 16)), lshift(data:sub(i+26,i+26):byte(), 8)), data:sub(i+27,i+27):byte())
        local chunk_8 = bor(bor(bor(lshift(data:sub(i+28,i+28):byte(), 24), lshift(data:sub(i+29,i+29):byte(), 16)), lshift(data:sub(i+30,i+30):byte(), 8)), data:sub(i+31,i+31):byte())
        local chunk_9 = bor(bor(bor(lshift(data:sub(i+32,i+32):byte(), 24), lshift(data:sub(i+33,i+33):byte(), 16)), lshift(data:sub(i+34,i+34):byte(), 8)), data:sub(i+35,i+35):byte())
        local chunk_10 = bor(bor(bor(lshift(data:sub(i+36,i+36):byte(), 24), lshift(data:sub(i+37,i+37):byte(), 16)), lshift(data:sub(i+38,i+38):byte(), 8)), data:sub(i+39,i+39):byte())
        local chunk_11 = bor(bor(bor(lshift(data:sub(i+40,i+40):byte(), 24), lshift(data:sub(i+41,i+41):byte(), 16)), lshift(data:sub(i+42,i+42):byte(), 8)), data:sub(i+43,i+43):byte())
        local chunk_12 = bor(bor(bor(lshift(data:sub(i+44,i+44):byte(), 24), lshift(data:sub(i+45,i+45):byte(), 16)), lshift(data:sub(i+46,i+46):byte(), 8)), data:sub(i+47,i+47):byte())
        local chunk_13 = bor(bor(bor(lshift(data:sub(i+48,i+48):byte(), 24), lshift(data:sub(i+49,i+49):byte(), 16)), lshift(data:sub(i+50,i+50):byte(), 8)), data:sub(i+51,i+51):byte())
        local chunk_14 = bor(bor(bor(lshift(data:sub(i+52,i+52):byte(), 24), lshift(data:sub(i+53,i+53):byte(), 16)), lshift(data:sub(i+54,i+54):byte(), 8)), data:sub(i+55,i+55):byte())
        local chunk_15 = bor(bor(bor(lshift(data:sub(i+56,i+56):byte(), 24), lshift(data:sub(i+57,i+57):byte(), 16)), lshift(data:sub(i+58,i+58):byte(), 8)), data:sub(i+59,i+59):byte())
        local chunk_16 = bor(bor(bor(lshift(data:sub(i+60,i+60):byte(), 24), lshift(data:sub(i+61,i+61):byte(), 16)), lshift(data:sub(i+62,i+62):byte(), 8)), data:sub(i+63,i+63):byte())
        local chunk_17 = tobit(chunk_1 + bxor(bxor(ror(chunk_2, 7), ror(chunk_2, 18)), rshift(chunk_2, 3)) + chunk_10 + bxor(bxor(ror(chunk_15, 17), ror(chunk_15, 19)), rshift(chunk_15, 10)))
        local chunk_18 = tobit(chunk_2 + bxor(bxor(ror(chunk_3, 7), ror(chunk_3, 18)), rshift(chunk_3, 3)) + chunk_11 + bxor(bxor(ror(chunk_16, 17), ror(chunk_16, 19)), rshift(chunk_16, 10)))
        local chunk_19 = tobit(chunk_3 + bxor(bxor(ror(chunk_4, 7), ror(chunk_4, 18)), rshift(chunk_4, 3)) + chunk_12 + bxor(bxor(ror(chunk_17, 17), ror(chunk_17, 19)), rshift(chunk_17, 10)))
        local chunk_20 = tobit(chunk_4 + bxor(bxor(ror(chunk_5, 7), ror(chunk_5, 18)), rshift(chunk_5, 3)) + chunk_13 + bxor(bxor(ror(chunk_18, 17), ror(chunk_18, 19)), rshift(chunk_18, 10)))
        local chunk_21 = tobit(chunk_5 + bxor(bxor(ror(chunk_6, 7), ror(chunk_6, 18)), rshift(chunk_6, 3)) + chunk_14 + bxor(bxor(ror(chunk_19, 17), ror(chunk_19, 19)), rshift(chunk_19, 10)))
        local chunk_22 = tobit(chunk_6 + bxor(bxor(ror(chunk_7, 7), ror(chunk_7, 18)), rshift(chunk_7, 3)) + chunk_15 + bxor(bxor(ror(chunk_20, 17), ror(chunk_20, 19)), rshift(chunk_20, 10)))
        local chunk_23 = tobit(chunk_7 + bxor(bxor(ror(chunk_8, 7), ror(chunk_8, 18)), rshift(chunk_8, 3)) + chunk_16 + bxor(bxor(ror(chunk_21, 17), ror(chunk_21, 19)), rshift(chunk_21, 10)))
        local chunk_24 = tobit(chunk_8 + bxor(bxor(ror(chunk_9, 7), ror(chunk_9, 18)), rshift(chunk_9, 3)) + chunk_17 + bxor(bxor(ror(chunk_22, 17), ror(chunk_22, 19)), rshift(chunk_22, 10)))
        local chunk_25 = tobit(chunk_9 + bxor(bxor(ror(chunk_10, 7), ror(chunk_10, 18)), rshift(chunk_10, 3)) + chunk_18 + bxor(bxor(ror(chunk_23, 17), ror(chunk_23, 19)), rshift(chunk_23, 10)))
        local chunk_26 = tobit(chunk_10 + bxor(bxor(ror(chunk_11, 7), ror(chunk_11, 18)), rshift(chunk_11, 3)) + chunk_19 + bxor(bxor(ror(chunk_24, 17), ror(chunk_24, 19)), rshift(chunk_24, 10)))
        local chunk_27 = tobit(chunk_11 + bxor(bxor(ror(chunk_12, 7), ror(chunk_12, 18)), rshift(chunk_12, 3)) + chunk_20 + bxor(bxor(ror(chunk_25, 17), ror(chunk_25, 19)), rshift(chunk_25, 10)))
        local chunk_28 = tobit(chunk_12 + bxor(bxor(ror(chunk_13, 7), ror(chunk_13, 18)), rshift(chunk_13, 3)) + chunk_21 + bxor(bxor(ror(chunk_26, 17), ror(chunk_26, 19)), rshift(chunk_26, 10)))
        local chunk_29 = tobit(chunk_13 + bxor(bxor(ror(chunk_14, 7), ror(chunk_14, 18)), rshift(chunk_14, 3)) + chunk_22 + bxor(bxor(ror(chunk_27, 17), ror(chunk_27, 19)), rshift(chunk_27, 10)))
        local chunk_30 = tobit(chunk_14 + bxor(bxor(ror(chunk_15, 7), ror(chunk_15, 18)), rshift(chunk_15, 3)) + chunk_23 + bxor(bxor(ror(chunk_28, 17), ror(chunk_28, 19)), rshift(chunk_28, 10)))
        local chunk_31 = tobit(chunk_15 + bxor(bxor(ror(chunk_16, 7), ror(chunk_16, 18)), rshift(chunk_16, 3)) + chunk_24 + bxor(bxor(ror(chunk_29, 17), ror(chunk_29, 19)), rshift(chunk_29, 10)))
        local chunk_32 = tobit(chunk_16 + bxor(bxor(ror(chunk_17, 7), ror(chunk_17, 18)), rshift(chunk_17, 3)) + chunk_25 + bxor(bxor(ror(chunk_30, 17), ror(chunk_30, 19)), rshift(chunk_30, 10)))
        local chunk_33 = tobit(chunk_17 + bxor(bxor(ror(chunk_18, 7), ror(chunk_18, 18)), rshift(chunk_18, 3)) + chunk_26 + bxor(bxor(ror(chunk_31, 17), ror(chunk_31, 19)), rshift(chunk_31, 10)))
        local chunk_34 = tobit(chunk_18 + bxor(bxor(ror(chunk_19, 7), ror(chunk_19, 18)), rshift(chunk_19, 3)) + chunk_27 + bxor(bxor(ror(chunk_32, 17), ror(chunk_32, 19)), rshift(chunk_32, 10)))
        local chunk_35 = tobit(chunk_19 + bxor(bxor(ror(chunk_20, 7), ror(chunk_20, 18)), rshift(chunk_20, 3)) + chunk_28 + bxor(bxor(ror(chunk_33, 17), ror(chunk_33, 19)), rshift(chunk_33, 10)))
        local chunk_36 = tobit(chunk_20 + bxor(bxor(ror(chunk_21, 7), ror(chunk_21, 18)), rshift(chunk_21, 3)) + chunk_29 + bxor(bxor(ror(chunk_34, 17), ror(chunk_34, 19)), rshift(chunk_34, 10)))
        local chunk_37 = tobit(chunk_21 + bxor(bxor(ror(chunk_22, 7), ror(chunk_22, 18)), rshift(chunk_22, 3)) + chunk_30 + bxor(bxor(ror(chunk_35, 17), ror(chunk_35, 19)), rshift(chunk_35, 10)))
        local chunk_38 = tobit(chunk_22 + bxor(bxor(ror(chunk_23, 7), ror(chunk_23, 18)), rshift(chunk_23, 3)) + chunk_31 + bxor(bxor(ror(chunk_36, 17), ror(chunk_36, 19)), rshift(chunk_36, 10)))
        local chunk_39 = tobit(chunk_23 + bxor(bxor(ror(chunk_24, 7), ror(chunk_24, 18)), rshift(chunk_24, 3)) + chunk_32 + bxor(bxor(ror(chunk_37, 17), ror(chunk_37, 19)), rshift(chunk_37, 10)))
        local chunk_40 = tobit(chunk_24 + bxor(bxor(ror(chunk_25, 7), ror(chunk_25, 18)), rshift(chunk_25, 3)) + chunk_33 + bxor(bxor(ror(chunk_38, 17), ror(chunk_38, 19)), rshift(chunk_38, 10)))
        local chunk_41 = tobit(chunk_25 + bxor(bxor(ror(chunk_26, 7), ror(chunk_26, 18)), rshift(chunk_26, 3)) + chunk_34 + bxor(bxor(ror(chunk_39, 17), ror(chunk_39, 19)), rshift(chunk_39, 10)))
        local chunk_42 = tobit(chunk_26 + bxor(bxor(ror(chunk_27, 7), ror(chunk_27, 18)), rshift(chunk_27, 3)) + chunk_35 + bxor(bxor(ror(chunk_40, 17), ror(chunk_40, 19)), rshift(chunk_40, 10)))
        local chunk_43 = tobit(chunk_27 + bxor(bxor(ror(chunk_28, 7), ror(chunk_28, 18)), rshift(chunk_28, 3)) + chunk_36 + bxor(bxor(ror(chunk_41, 17), ror(chunk_41, 19)), rshift(chunk_41, 10)))
        local chunk_44 = tobit(chunk_28 + bxor(bxor(ror(chunk_29, 7), ror(chunk_29, 18)), rshift(chunk_29, 3)) + chunk_37 + bxor(bxor(ror(chunk_42, 17), ror(chunk_42, 19)), rshift(chunk_42, 10)))
        local chunk_45 = tobit(chunk_29 + bxor(bxor(ror(chunk_30, 7), ror(chunk_30, 18)), rshift(chunk_30, 3)) + chunk_38 + bxor(bxor(ror(chunk_43, 17), ror(chunk_43, 19)), rshift(chunk_43, 10)))
        local chunk_46 = tobit(chunk_30 + bxor(bxor(ror(chunk_31, 7), ror(chunk_31, 18)), rshift(chunk_31, 3)) + chunk_39 + bxor(bxor(ror(chunk_44, 17), ror(chunk_44, 19)), rshift(chunk_44, 10)))
        local chunk_47 = tobit(chunk_31 + bxor(bxor(ror(chunk_32, 7), ror(chunk_32, 18)), rshift(chunk_32, 3)) + chunk_40 + bxor(bxor(ror(chunk_45, 17), ror(chunk_45, 19)), rshift(chunk_45, 10)))
        local chunk_48 = tobit(chunk_32 + bxor(bxor(ror(chunk_33, 7), ror(chunk_33, 18)), rshift(chunk_33, 3)) + chunk_41 + bxor(bxor(ror(chunk_46, 17), ror(chunk_46, 19)), rshift(chunk_46, 10)))
        local chunk_49 = tobit(chunk_33 + bxor(bxor(ror(chunk_34, 7), ror(chunk_34, 18)), rshift(chunk_34, 3)) + chunk_42 + bxor(bxor(ror(chunk_47, 17), ror(chunk_47, 19)), rshift(chunk_47, 10)))
        local chunk_50 = tobit(chunk_34 + bxor(bxor(ror(chunk_35, 7), ror(chunk_35, 18)), rshift(chunk_35, 3)) + chunk_43 + bxor(bxor(ror(chunk_48, 17), ror(chunk_48, 19)), rshift(chunk_48, 10)))
        local chunk_51 = tobit(chunk_35 + bxor(bxor(ror(chunk_36, 7), ror(chunk_36, 18)), rshift(chunk_36, 3)) + chunk_44 + bxor(bxor(ror(chunk_49, 17), ror(chunk_49, 19)), rshift(chunk_49, 10)))
        local chunk_52 = tobit(chunk_36 + bxor(bxor(ror(chunk_37, 7), ror(chunk_37, 18)), rshift(chunk_37, 3)) + chunk_45 + bxor(bxor(ror(chunk_50, 17), ror(chunk_50, 19)), rshift(chunk_50, 10)))
        local chunk_53 = tobit(chunk_37 + bxor(bxor(ror(chunk_38, 7), ror(chunk_38, 18)), rshift(chunk_38, 3)) + chunk_46 + bxor(bxor(ror(chunk_51, 17), ror(chunk_51, 19)), rshift(chunk_51, 10)))
        local chunk_54 = tobit(chunk_38 + bxor(bxor(ror(chunk_39, 7), ror(chunk_39, 18)), rshift(chunk_39, 3)) + chunk_47 + bxor(bxor(ror(chunk_52, 17), ror(chunk_52, 19)), rshift(chunk_52, 10)))
        local chunk_55 = tobit(chunk_39 + bxor(bxor(ror(chunk_40, 7), ror(chunk_40, 18)), rshift(chunk_40, 3)) + chunk_48 + bxor(bxor(ror(chunk_53, 17), ror(chunk_53, 19)), rshift(chunk_53, 10)))
        local chunk_56 = tobit(chunk_40 + bxor(bxor(ror(chunk_41, 7), ror(chunk_41, 18)), rshift(chunk_41, 3)) + chunk_49 + bxor(bxor(ror(chunk_54, 17), ror(chunk_54, 19)), rshift(chunk_54, 10)))
        local chunk_57 = tobit(chunk_41 + bxor(bxor(ror(chunk_42, 7), ror(chunk_42, 18)), rshift(chunk_42, 3)) + chunk_50 + bxor(bxor(ror(chunk_55, 17), ror(chunk_55, 19)), rshift(chunk_55, 10)))
        local chunk_58 = tobit(chunk_42 + bxor(bxor(ror(chunk_43, 7), ror(chunk_43, 18)), rshift(chunk_43, 3)) + chunk_51 + bxor(bxor(ror(chunk_56, 17), ror(chunk_56, 19)), rshift(chunk_56, 10)))
        local chunk_59 = tobit(chunk_43 + bxor(bxor(ror(chunk_44, 7), ror(chunk_44, 18)), rshift(chunk_44, 3)) + chunk_52 + bxor(bxor(ror(chunk_57, 17), ror(chunk_57, 19)), rshift(chunk_57, 10)))
        local chunk_60 = tobit(chunk_44 + bxor(bxor(ror(chunk_45, 7), ror(chunk_45, 18)), rshift(chunk_45, 3)) + chunk_53 + bxor(bxor(ror(chunk_58, 17), ror(chunk_58, 19)), rshift(chunk_58, 10)))
        local chunk_61 = tobit(chunk_45 + bxor(bxor(ror(chunk_46, 7), ror(chunk_46, 18)), rshift(chunk_46, 3)) + chunk_54 + bxor(bxor(ror(chunk_59, 17), ror(chunk_59, 19)), rshift(chunk_59, 10)))
        local chunk_62 = tobit(chunk_46 + bxor(bxor(ror(chunk_47, 7), ror(chunk_47, 18)), rshift(chunk_47, 3)) + chunk_55 + bxor(bxor(ror(chunk_60, 17), ror(chunk_60, 19)), rshift(chunk_60, 10)))
        local chunk_63 = tobit(chunk_47 + bxor(bxor(ror(chunk_48, 7), ror(chunk_48, 18)), rshift(chunk_48, 3)) + chunk_56 + bxor(bxor(ror(chunk_61, 17), ror(chunk_61, 19)), rshift(chunk_61, 10)))
        local chunk_64 = tobit(chunk_48 + bxor(bxor(ror(chunk_49, 7), ror(chunk_49, 18)), rshift(chunk_49, 3)) + chunk_57 + bxor(bxor(ror(chunk_62, 17), ror(chunk_62, 19)), rshift(chunk_62, 10)))

        local a = h0
        local b = h1
        local c = h2
        local d = h3
        local e = h4
        local f = h5
        local g = h6
        local h = h7

        local t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1116352408 + chunk_1) local t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1899447441 + chunk_2) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3049323471 + chunk_3) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3921009573 + chunk_4) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 961987163 + chunk_5) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1508970993 + chunk_6) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2453635748 + chunk_7) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2870763221 + chunk_8) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3624381080 + chunk_9) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 310598401 + chunk_10) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 607225278 + chunk_11) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1426881987 + chunk_12) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1925078388 + chunk_13) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2162078206 + chunk_14) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2614888103 + chunk_15) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3248222580 + chunk_16) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3835390401 + chunk_17) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 4022224774 + chunk_18) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 264347078 + chunk_19) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 604807628 + chunk_20) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 770255983 + chunk_21) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1249150122 + chunk_22) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1555081692 + chunk_23) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1996064986 + chunk_24) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2554220882 + chunk_25) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2821834349 + chunk_26) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2952996808 + chunk_27) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3210313671 + chunk_28) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3336571891 + chunk_29) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3584528711 + chunk_30) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 113926993 + chunk_31) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 338241895 + chunk_32) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 666307205 + chunk_33) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 773529912 + chunk_34) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1294757372 + chunk_35) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1396182291 + chunk_36) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1695183700 + chunk_37) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1986661051 + chunk_38) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2177026350 + chunk_39) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2456956037 + chunk_40) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2730485921 + chunk_41) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2820302411 + chunk_42) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3259730800 + chunk_43) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3345764771 + chunk_44) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3516065817 + chunk_45) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3600352804 + chunk_46) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 4094571909 + chunk_47) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 275423344 + chunk_48) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 430227734 + chunk_49) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 506948616 + chunk_50) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 659060556 + chunk_51) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 883997877 + chunk_52) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 958139571 + chunk_53) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1322822218 + chunk_54) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1537002063 + chunk_55) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1747873779 + chunk_56) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 1955562222 + chunk_57) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2024104815 + chunk_58) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2227730452 + chunk_59) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2361852424 + chunk_60) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2428436474 + chunk_61) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 2756734187 + chunk_62) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3204031479 + chunk_63) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)
        t = tobit(h + bxor(bxor(ror(e, 6), ror(e, 11)), ror(e, 25)) + bxor(band(e, f), band(bnot(e), g)) + 3329325298 + chunk_64) t1 = tobit(bxor(bxor(ror(a, 2), ror(a, 13)), ror(a, 22)) + bxor(bxor(band(a, b), band(a, c)), band(b, c))) h=g g=f f=e e=tobit(d + t) d=c c=b b=a a=tobit(t + t1)

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