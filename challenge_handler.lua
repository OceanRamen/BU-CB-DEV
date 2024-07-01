local lovely = require("lovely")
local nativefs = require("nativefs")

local function get_chal_files(directory)
  local files = {}
  local items = nativefs.getDirectoryItems(directory)
  for _, item in ipairs(items) do
    if item:match("%.lua$") then
      table.insert(files, item)
    end
  end
  return files
end

local directory = ChallengeMod.PATH .. "Challenges/"

local lua_files = get_chal_files(directory)

local CustomChallenges = {}

for _, file in ipairs(lua_files) do
  local file_path = directory .. "/" .. file
  local challenge = dofile(file_path)
--   print(ChallengeMod.Helper.inspectDepth(challenge))
  table.insert(CustomChallenges, challenge)
end

-- print(inspectDepth(CustomChallenges))
table.sort(CustomChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

function ChallengeMod.localizeChalNames()
  for i, v in ipairs(CustomChallenges) do
    v.DATA.name = v.NAME
    v.DATA.id = "cm_mod_" .. v.NAME:gsub("%s+", "_") .. "_1"
    table.insert(v.DATA.rules.custom, {id="cm_credit", value=v.DESIGNER})
    table.insert(v.DATA.rules.custom, { id = "cm_VERSION", value = v.VERSION})
    G.localization.misc.challenge_names[v.DATA.id] = v.DATA.name
  end
  if not ChallengeMod.RELEASE then
    G.localization.misc.v_text.ch_c_cm_VERSION = {"{C:purple}VERSION: #1#{}"}
  end
  G.localization.misc.v_text.ch_c_cm_credit = { "Designed by: {C:green}#1#{}" }
end

for i, v in pairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v.DATA)
end
