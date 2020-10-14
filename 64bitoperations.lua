--простое описание операций для библиотек требующих 64 битные числа разделенные на левую и правую часть
--нету операций по типу bit.band, bit.bor, bit.bxor ибо это элементарные операции

require"bit"

-- H and L - 32bit int
-- (H .. L) - 64 bit int

local bor = bit.bor
local tobit = bit.tobit
local lshift = bit.lshift
local rshift = bit.rshift
local floor = math.floor

--rotate left (H .. L) <<< n
local result_L = bor(rshift(R, 32-n), lshift(L, n))
local result_R = bor(lshift(R, n), rshift(L, 32-n))

--rotate right (H .. L) >>> n
local result_L = bor(lshift(R, 32-n), rshift(L, n))
local result_R = bor(rshift(R, n), lshift(L, 32-n))



--shift left (H .. L) << n
local result_L = bor(rshift(R, 32-n), lshift(L, n))
local result_R = lshift(R, n)

--shift right (H .. L) >> n
local result_L = rshift(L, n)
local result_R = bor(rshift(R, n), lshift(L, 32-n))



--sum (H0 .. L0) + (H1 .. L1)
local result_L = tobit(L0 + L1 + floor((R0 % 0x100000000 + R1 % 0x100000000) / 0x100000000))
local result_R = tobit(R0 + R1)

