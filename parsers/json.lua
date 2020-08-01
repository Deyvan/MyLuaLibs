
local function minifier(stringJson) end
local function unminifier(stringJson) end

local function toTable(stringJson) end
local function toJson(tbl) end

return {
    minifier = minifier,
    unminifier = unminifier,
    toTable = toTable,
    toJson = toJson
}
