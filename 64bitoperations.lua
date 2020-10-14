--простое описание операций для библиотек требующих 64 битные числа разделенные на левую и правую часть
--нету операций по типу bit.band, bit.bor, bit.bxor ибо это элементарные операции

require"bit"

-- L and R - 32bit int
-- (L .. R) - 64 bit int
-- tobit(num) = num % 0xFFFFFFFF

local bor = bit.bor
local tobit = bit.tobit
local lshift = bit.lshift
local rshift = bit.rshift

local function overflowbit32(L, R)
	if L < 0 then L = 0x100000000 + L end
	if R < 0 then R = 0x100000000 + R end
	if (L+R) > 0xFFFFFFFF then return 1 end
	return 0
end

--rotate left (L .. R) <<< n
local result_L = bor(rshift(R, 32-n), lshift(L, n))
local result_R = bor(lshift(R, n), rshift(L, 32-n))

--rotate right (L .. R) >>> n
local result_L = bor(lshift(R, 32-n), rshift(L, n))
local result_R = bor(rshift(R, n), lshift(L, 32-n))



--shift left (L .. R) << n
local result_L = bor(rshift(R, 32-n), lshift(L, n))
local result_R = lshift(R, n)

--shift right (L .. R) >> n
local result_L = rshift(L, n)
local result_R = bor(rshift(R, n), lshift(L, 32-n))



--sum (L0 .. R0) + (L1 .. R1)
local result_L = tobit(L0 + L1 + overflowbit32(R0, R1))
local result_R = tobit(R0 + R1)

