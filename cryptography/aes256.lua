local sbox = {[0]=99,[1]=124,[2]=119,[3]=123,[4]=242,[5]=107,[6]=111,[7]=197,[8]=48,[9]=1,[10]=103,[11]=43,[12]=254,[13]=215,[14]=171,[15]=118,[16]=202,[17]=130,[18]=201,[19]=125,[20]=250,[21]=89,[22]=71,[23]=240,[24]=173,[25]=212,[26]=162,[27]=175,[28]=156,[29]=164,[30]=114,[31]=192,[32]=183,[33]=253,[34]=147,[35]=38,[36]=54,[37]=63,[38]=247,[39]=204,[40]=52,[41]=165,[42]=229,[43]=241,[44]=113,[45]=216,[46]=49,[47]=21,[48]=4,[49]=199,[50]=35,[51]=195,[52]=24,[53]=150,[54]=5,[55]=154,[56]=7,[57]=18,[58]=128,[59]=226,[60]=235,[61]=39,[62]=178,[63]=117,[64]=9,[65]=131,[66]=44,[67]=26,[68]=27,[69]=110,[70]=90,[71]=160,[72]=82,[73]=59,[74]=214,[75]=179,[76]=41,[77]=227,[78]=47,[79]=132,[80]=83,[81]=209,[82]=0,[83]=237,[84]=32,[85]=252,[86]=177,[87]=91,[88]=106,[89]=203,[90]=190,[91]=57,[92]=74,[93]=76,[94]=88,[95]=207,[96]=208,[97]=239,[98]=170,[99]=251,[100]=67,[101]=77,[102]=51,[103]=133,[104]=69,[105]=249,[106]=2,[107]=127,[108]=80,[109]=60,[110]=159,[111]=168,[112]=81,[113]=163,[114]=64,[115]=143,[116]=146,[117]=157,[118]=56,[119]=245,[120]=188,[121]=182,[122]=218,[123]=33,[124]=16,[125]=255,[126]=243,[127]=210,[128]=205,[129]=12,[130]=19,[131]=236,[132]=95,[133]=151,[134]=68,[135]=23,[136]=196,[137]=167,[138]=126,[139]=61,[140]=100,[141]=93,[142]=25,[143]=115,[144]=96,[145]=129,[146]=79,[147]=220,[148]=34,[149]=42,[150]=144,[151]=136,[152]=70,[153]=238,[154]=184,[155]=20,[156]=222,[157]=94,[158]=11,[159]=219,[160]=224,[161]=50,[162]=58,[163]=10,[164]=73,[165]=6,[166]=36,[167]=92,[168]=194,[169]=211,[170]=172,[171]=98,[172]=145,[173]=149,[174]=228,[175]=121,[176]=231,[177]=200,[178]=55,[179]=109,[180]=141,[181]=213,[182]=78,[183]=169,[184]=108,[185]=86,[186]=244,[187]=234,[188]=101,[189]=122,[190]=174,[191]=8,[192]=186,[193]=120,[194]=37,[195]=46,[196]=28,[197]=166,[198]=180,[199]=198,[200]=232,[201]=221,[202]=116,[203]=31,[204]=75,[205]=189,[206]=139,[207]=138,[208]=112,[209]=62,[210]=181,[211]=102,[212]=72,[213]=3,[214]=246,[215]=14,[216]=97,[217]=53,[218]=87,[219]=185,[220]=134,[221]=193,[222]=29,[223]=158,[224]=225,[225]=248,[226]=152,[227]=17,[228]=105,[229]=217,[230]=142,[231]=148,[232]=155,[233]=30,[234]=135,[235]=233,[236]=206,[237]=85,[238]=40,[239]=223,[240]=140,[241]=161,[242]=137,[243]=13,[244]=191,[245]=230,[246]=66,[247]=104,[248]=65,[249]=153,[250]=45,[251]=15,[252]=176,[253]=84,[254]=187,[255]=22}
local invsbox = {[99]=0,[124]=1,[119]=2,[123]=3,[242]=4,[107]=5,[111]=6,[197]=7,[48]=8,[1]=9,[103]=10,[43]=11,[254]=12,[215]=13,[171]=14,[118]=15,[202]=16,[130]=17,[201]=18,[125]=19,[250]=20,[89]=21,[71]=22,[240]=23,[173]=24,[212]=25,[162]=26,[175]=27,[156]=28,[164]=29,[114]=30,[192]=31,[183]=32,[253]=33,[147]=34,[38]=35,[54]=36,[63]=37,[247]=38,[204]=39,[52]=40,[165]=41,[229]=42,[241]=43,[113]=44,[216]=45,[49]=46,[21]=47,[4]=48,[199]=49,[35]=50,[195]=51,[24]=52,[150]=53,[5]=54,[154]=55,[7]=56,[18]=57,[128]=58,[226]=59,[235]=60,[39]=61,[178]=62,[117]=63,[9]=64,[131]=65,[44]=66,[26]=67,[27]=68,[110]=69,[90]=70,[160]=71,[82]=72,[59]=73,[214]=74,[179]=75,[41]=76,[227]=77,[47]=78,[132]=79,[83]=80,[209]=81,[0]=82,[237]=83,[32]=84,[252]=85,[177]=86,[91]=87,[106]=88,[203]=89,[190]=90,[57]=91,[74]=92,[76]=93,[88]=94,[207]=95,[208]=96,[239]=97,[170]=98,[251]=99,[67]=100,[77]=101,[51]=102,[133]=103,[69]=104,[249]=105,[2]=106,[127]=107,[80]=108,[60]=109,[159]=110,[168]=111,[81]=112,[163]=113,[64]=114,[143]=115,[146]=116,[157]=117,[56]=118,[245]=119,[188]=120,[182]=121,[218]=122,[33]=123,[16]=124,[255]=125,[243]=126,[210]=127,[205]=128,[12]=129,[19]=130,[236]=131,[95]=132,[151]=133,[68]=134,[23]=135,[196]=136,[167]=137,[126]=138,[61]=139,[100]=140,[93]=141,[25]=142,[115]=143,[96]=144,[129]=145,[79]=146,[220]=147,[34]=148,[42]=149,[144]=150,[136]=151,[70]=152,[238]=153,[184]=154,[20]=155,[222]=156,[94]=157,[11]=158,[219]=159,[224]=160,[50]=161,[58]=162,[10]=163,[73]=164,[6]=165,[36]=166,[92]=167,[194]=168,[211]=169,[172]=170,[98]=171,[145]=172,[149]=173,[228]=174,[121]=175,[231]=176,[200]=177,[55]=178,[109]=179,[141]=180,[213]=181,[78]=182,[169]=183,[108]=184,[86]=185,[244]=186,[234]=187,[101]=188,[122]=189,[174]=190,[8]=191,[186]=192,[120]=193,[37]=194,[46]=195,[28]=196,[166]=197,[180]=198,[198]=199,[232]=200,[221]=201,[116]=202,[31]=203,[75]=204,[189]=205,[139]=206,[138]=207,[112]=208,[62]=209,[181]=210,[102]=211,[72]=212,[3]=213,[246]=214,[14]=215,[97]=216,[53]=217,[87]=218,[185]=219,[134]=220,[193]=221,[29]=222,[158]=223,[225]=224,[248]=225,[152]=226,[17]=227,[105]=228,[217]=229,[142]=230,[148]=231,[155]=232,[30]=233,[135]=234,[233]=235,[206]=236,[85]=237,[40]=238,[223]=239,[140]=240,[161]=241,[137]=242,[13]=243,[191]=244,[230]=245,[66]=246,[104]=247,[65]=248,[153]=249,[45]=250,[15]=251,[176]=252,[84]=253,[187]=254,[22]=255}
local rcon = {1, 2, 4, 8, 16, 32, 64}

local bit = _G.bit or _G.bit32

if not bit then
    local status, tbl = pcall(require, "bit")
    if status then bit = tbl end

    local status, tbl = pcall(require, "bit32")
    if status then bit = tbl end
end

if not bit then error("bit library not found!") end

local char = string.char
local bxor = bit.bxor
local band = bit.band
local rshift = bit.rshift
local lshift = bit.lshift

local function gf(a, b)
    local p = 0
    for i = 0, 8 do
        if band(b, 1) == 1 then p = bxor(p, a) end
        local t = band(a, 0x80)
        a = band(lshift(a, 1), 255)
        if t == 0x80 then a = bxor(a, 0x1b) end
        b = rshift(b, 1)
    end
    return p
end

local function expandkey(key)
    local _ = {
        key:sub(1,1):byte(), key:sub(2,2):byte(), key:sub(3,3):byte(), key:sub(4,4):byte(), key:sub(5,5):byte(), key:sub(6,6):byte(), key:sub(7,7):byte(), key:sub(8,8):byte(),
        key:sub(9,9):byte(), key:sub(10,10):byte(), key:sub(11,11):byte(), key:sub(12,12):byte(), key:sub(13,13):byte(), key:sub(14,14):byte(), key:sub(15,15):byte(), key:sub(16,16):byte(),
        key:sub(17,17):byte(), key:sub(18,18):byte(), key:sub(19,19):byte(), key:sub(20,20):byte(), key:sub(21,21):byte(), key:sub(22,22):byte(), key:sub(23,23):byte(), key:sub(24,24):byte(),
        key:sub(25,25):byte(), key:sub(26,26):byte(), key:sub(27,27):byte(), key:sub(28,28):byte(), key:sub(29,29):byte(), key:sub(30,30):byte(), key:sub(31,31):byte(), key:sub(32,32):byte(), 
    }
    local _i = 1
    for r = 1, 7 do
        _[_i+32], _[_i+33], _[_i+34], _[_i+35] = bxor(_[_i], bxor(sbox[_[_i+29]], rcon[r])), bxor(_[_i+1], sbox[_[_i+30]]), bxor(_[_i+2], sbox[_[_i+31]]), bxor(_[_i+3], sbox[_[_i+28]])
        _[_i+36], _[_i+37], _[_i+38], _[_i+39] = bxor(_[_i+4], _[_i+32]), bxor(_[_i+5], _[_i+33]), bxor(_[_i+6], _[_i+34]), bxor(_[_i+7], _[_i+35])
        _[_i+40], _[_i+41], _[_i+42], _[_i+43] = bxor(_[_i+8], _[_i+36]), bxor(_[_i+9], _[_i+37]), bxor(_[_i+10], _[_i+38]), bxor(_[_i+11], _[_i+39])
        _[_i+44], _[_i+45], _[_i+46], _[_i+47] = bxor(_[_i+12], _[_i+40]), bxor(_[_i+13], _[_i+41]), bxor(_[_i+14], _[_i+42]), bxor(_[_i+15], _[_i+43])
        if r ~= 7 then
            _[_i+48], _[_i+49], _[_i+50], _[_i+51] = bxor(_[_i+16], sbox[_[_i+44]]), bxor(_[_i+17], sbox[_[_i+45]]), bxor(_[_i+18], sbox[_[_i+46]]), bxor(_[_i+19], sbox[_[_i+47]])
            _[_i+52], _[_i+53], _[_i+54], _[_i+55] = bxor(_[_i+20], _[_i+48]),       bxor(_[_i+21], _[_i+49]),       bxor(_[_i+22], _[_i+50]),       bxor(_[_i+23], _[_i+51])
            _[_i+56], _[_i+57], _[_i+58], _[_i+59] = bxor(_[_i+24], _[_i+52]),       bxor(_[_i+25], _[_i+53]),       bxor(_[_i+26], _[_i+54]),       bxor(_[_i+27], _[_i+55])
            _[_i+60], _[_i+61], _[_i+62], _[_i+63] = bxor(_[_i+28], _[_i+56]),       bxor(_[_i+29], _[_i+57]),       bxor(_[_i+30], _[_i+58]),       bxor(_[_i+31], _[_i+59])
        end
        _i = _i + 32
    end
    return _
end

local function encrypt(datachunk, expandedkey)
    local _i = 1
    local __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16 = bxor(datachunk:sub(1,1):byte(), expandedkey[_i]), bxor(datachunk:sub(2,2):byte(), expandedkey[_i+1]), bxor(datachunk:sub(3,3):byte(), expandedkey[_i+2]), bxor(datachunk:sub(4,4):byte(), expandedkey[_i+3]), bxor(datachunk:sub(5,5):byte(), expandedkey[_i+4]),bxor(datachunk:sub(6,6):byte(), expandedkey[_i+5]), bxor(datachunk:sub(7,7):byte(), expandedkey[_i+6]), bxor(datachunk:sub(8,8):byte(), expandedkey[_i+7]), bxor(datachunk:sub(9,9):byte(), expandedkey[_i+8]), bxor(datachunk:sub(10,10):byte(), expandedkey[_i+9]), bxor(datachunk:sub(11,11):byte(), expandedkey[_i+10]),bxor(datachunk:sub(12,12):byte(), expandedkey[_i+11]), bxor(datachunk:sub(13,13):byte(), expandedkey[_i+12]), bxor(datachunk:sub(14,14):byte(), expandedkey[_i+13]), bxor(datachunk:sub(15,15):byte(), expandedkey[_i+14]), bxor(datachunk:sub(16,16):byte(), expandedkey[_i+15])
    for i = 1, 13 do
        _i = _i + 16
        __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16 = sbox[__1], sbox[__6], sbox[__11], sbox[__16], sbox[__5], sbox[__10], sbox[__15], sbox[__4], sbox[__9], sbox[__14], sbox[__3], sbox[__8], sbox[__13], sbox[__2], sbox[__7], sbox[__12]
        __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16 =bxor(bxor(bxor(bxor(gf(2, __1), gf(3, __2)), __3), __4), expandedkey[_i]), bxor(bxor(bxor(bxor(gf(2, __2), gf(3, __3)), __4), __1), expandedkey[_i+1]),bxor(bxor(bxor(bxor(gf(2, __3), gf(3, __4)), __1), __2), expandedkey[_i+2]), bxor(bxor(bxor(bxor(gf(2, __4), gf(3, __1)), __2), __3), expandedkey[_i+3]),bxor(bxor(bxor(bxor(gf(2, __5), gf(3, __6)), __7), __8), expandedkey[_i+4]), bxor(bxor(bxor(bxor(gf(2, __6), gf(3, __7)), __8), __5), expandedkey[_i+5]),bxor(bxor(bxor(bxor(gf(2, __7), gf(3, __8)), __5), __6), expandedkey[_i+6]), bxor(bxor(bxor(bxor(gf(2, __8), gf(3, __5)), __6), __7), expandedkey[_i+7]),bxor(bxor(bxor(bxor(gf(2, __9), gf(3, __10)), __11), __12), expandedkey[_i+8]), bxor(bxor(bxor(bxor(gf(2, __10), gf(3, __11)), __12), __9), expandedkey[_i+9]),bxor(bxor(bxor(bxor(gf(2, __11), gf(3, __12)), __9), __10), expandedkey[_i+10]), bxor(bxor(bxor(bxor(gf(2, __12), gf(3, __9)), __10), __11), expandedkey[_i+11]),bxor(bxor(bxor(bxor(gf(2, __13), gf(3, __14)), __15), __16), expandedkey[_i+12]), bxor(bxor(bxor(bxor(gf(2, __14), gf(3, __15)), __16), __13), expandedkey[_i+13]),bxor(bxor(bxor(bxor(gf(2, __15), gf(3, __16)), __13), __14), expandedkey[_i+14]), bxor(bxor(bxor(bxor(gf(2, __16), gf(3, __13)), __14), __15), expandedkey[_i+15])
    end
    _i = _i + 16
    return char(bxor(sbox[__1], expandedkey[_i])) .. char(bxor(sbox[__6], expandedkey[_i+1])) .. char(bxor(sbox[__11], expandedkey[_i+2])) ..char(bxor(sbox[__16], expandedkey[_i+3])) .. char(bxor(sbox[__5], expandedkey[_i+4])) .. char(bxor(sbox[__10], expandedkey[_i+5])) ..char(bxor(sbox[__15], expandedkey[_i+6])) .. char(bxor(sbox[__4], expandedkey[_i+7])) .. char(bxor(sbox[__9], expandedkey[_i+8])) ..char(bxor(sbox[__14], expandedkey[_i+9])) .. char(bxor(sbox[__3], expandedkey[_i+10])) .. char(bxor(sbox[__8], expandedkey[_i+11])) ..char(bxor(sbox[__13], expandedkey[_i+12])) .. char(bxor(sbox[__2], expandedkey[_i+13])) .. char(bxor(sbox[__7], expandedkey[_i+14])) .. char(bxor(sbox[__12], expandedkey[_i+15]))
end

local function decrypt(datachunk, expandedkey)
    local _i = 225
    local __1, __6, __11, __16, __5, __10, __15, __4, __9, __14, __3, __8, __13, __2, __7, __12 = invsbox[bxor(datachunk:sub(1,1):byte(), expandedkey[_i])], invsbox[bxor(datachunk:sub(2,2):byte(), expandedkey[_i+1])], invsbox[bxor(datachunk:sub(3,3):byte(), expandedkey[_i+2])], invsbox[bxor(datachunk:sub(4,4):byte(), expandedkey[_i+3])], invsbox[bxor(datachunk:sub(5,5):byte(), expandedkey[_i+4])], invsbox[bxor(datachunk:sub(6,6):byte(), expandedkey[_i+5])], invsbox[bxor(datachunk:sub(7,7):byte(), expandedkey[_i+6])], invsbox[bxor(datachunk:sub(8,8):byte(), expandedkey[_i+7])], invsbox[bxor(datachunk:sub(9,9):byte(), expandedkey[_i+8])], invsbox[bxor(datachunk:sub(10,10):byte(), expandedkey[_i+9])], invsbox[bxor(datachunk:sub(11,11):byte(), expandedkey[_i+10])], invsbox[bxor(datachunk:sub(12,12):byte(), expandedkey[_i+11])], invsbox[bxor(datachunk:sub(13,13):byte(), expandedkey[_i+12])], invsbox[bxor(datachunk:sub(14,14):byte(), expandedkey[_i+13])], invsbox[bxor(datachunk:sub(15,15):byte(), expandedkey[_i+14])], invsbox[bxor(datachunk:sub(16,16):byte(), expandedkey[_i+15])]
    for i = 1, 13 do
        _i = _i - 16
        __1, __2, __3, __4, __5, __6, __7, __8, __9, __10, __11, __12, __13, __14, __15, __16 = bxor(__1, expandedkey[_i]), bxor(__2, expandedkey[_i+1]), bxor(__3, expandedkey[_i+2]), bxor(__4, expandedkey[_i+3]), bxor(__5, expandedkey[_i+4]), bxor(__6, expandedkey[_i+5]), bxor(__7, expandedkey[_i+6]), bxor(__8, expandedkey[_i+7]), bxor(__9, expandedkey[_i+8]), bxor(__10, expandedkey[_i+9]), bxor(__11, expandedkey[_i+10]), bxor(__12, expandedkey[_i+11]), bxor(__13, expandedkey[_i+12]), bxor(__14, expandedkey[_i+13]), bxor(__15, expandedkey[_i+14]), bxor(__16, expandedkey[_i+15])
        __1, __6, __11, __16, __5, __10, __15, __4, __9, __14, __3, __8, __13, __2, __7, __12 = invsbox[bxor(bxor(bxor(gf(14, __1),  gf(11, __2)),  gf(13,__3)),  gf(9,__4))],invsbox[bxor(bxor(bxor(gf(9, __1),   gf(14, __2)),  gf(11,__3)),  gf(13,__4))],invsbox[bxor(bxor(bxor(gf(13, __1),  gf(9, __2)),   gf(14,__3)),  gf(11,__4))],invsbox[bxor(bxor(bxor(gf(11, __1),  gf(13, __2)),  gf(9,__3)),   gf(14,__4))],invsbox[bxor(bxor(bxor(gf(14, __5),  gf(11, __6)),  gf(13,__7)),  gf(9,__8))],invsbox[bxor(bxor(bxor(gf(9, __5),   gf(14, __6)),  gf(11,__7)),  gf(13,__8))],invsbox[bxor(bxor(bxor(gf(13, __5),  gf(9, __6)),   gf(14,__7)),  gf(11,__8))],invsbox[bxor(bxor(bxor(gf(11, __5),  gf(13, __6)),  gf(9,__7)),   gf(14,__8))],invsbox[bxor(bxor(bxor(gf(14, __9),  gf(11, __10)), gf(13,__11)), gf(9,__12))],invsbox[bxor(bxor(bxor(gf(9, __9),  gf(14, __10)), gf(11,__11)), gf(13,__12))],invsbox[bxor(bxor(bxor(gf(13, __9), gf(9, __10)),  gf(14,__11)),  gf(11,__12))],invsbox[bxor(bxor(bxor(gf(11, __9), gf(13, __10)),  gf(9,__11)),  gf(14,__12))],invsbox[bxor(bxor(bxor(gf(14, __13), gf(11, __14)), gf(13,__15)), gf(9,__16))],invsbox[bxor(bxor(bxor(gf(9, __13),  gf(14, __14)), gf(11,__15)), gf(13,__16))],invsbox[bxor(bxor(bxor(gf(13, __13), gf(9, __14)),  gf(14,__15)), gf(11,__16))],invsbox[bxor(bxor(bxor(gf(11, __13), gf(13, __14)), gf(9,__15)),  gf(14,__16))]
    end
    _i = _i - 16
    return char(bxor(__1, expandedkey[_i])) .. char(bxor(__2, expandedkey[_i+1])) .. char(bxor(__3, expandedkey[_i+2])) .. char(bxor(__4, expandedkey[_i+3])) ..char(bxor(__5, expandedkey[_i+4])) .. char(bxor(__6, expandedkey[_i+5])) .. char(bxor(__7, expandedkey[_i+6])) .. char(bxor(__8, expandedkey[_i+7])) ..char(bxor(__9, expandedkey[_i+8])) .. char(bxor(__10, expandedkey[_i+9])) .. char(bxor(__11, expandedkey[_i+10])) .. char(bxor(__12, expandedkey[_i+11])) ..char(bxor(__13, expandedkey[_i+12])) .. char(bxor(__14, expandedkey[_i+13])) .. char(bxor(__15, expandedkey[_i+14])) .. char(bxor(__16, expandedkey[_i+15]))
end

return{
    expandkey = expandkey,
    encrypt = encrypt,
    decrypt = decrypt
}
