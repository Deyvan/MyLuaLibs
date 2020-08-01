
local function minifier(stringJson) end
local function unMinifier(stringJson) end

local function toTable(stringJson) end
local function toJson(tbl, min) end

return {
    minifier = minifier,
    unminifier = unminifier,
    toTable = toTable,
    toJson = toJson
}
