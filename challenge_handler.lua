local lovely = require("lovely")
local nativefs = require("nativefs")

--- Gets all Lua files in a directory.
-- @param directory The directory to search for Lua files.
-- @return A table of Lua files in the directory.
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

local chal_directory = ChallengeMod.PATH .. "Challenges/"
local chal_lua_files = get_chal_files(chal_directory)
local CustomChallenges = {}

-- Load custom challenges
for _, file in ipairs(chal_lua_files) do
  local file_path = chal_directory .. "/" .. file
  local challenge = dofile(file_path)
  table.insert(CustomChallenges, challenge)
end

-- Sort custom challenges by creation date
table.sort(CustomChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

--- Localizes the challenge names and updates their data.
function ChallengeMod.localizeChalNames()
  -- Localize custom challenges
  for _, challenge in ipairs(CustomChallenges) do
    challenge.DATA.name = challenge.NAME
    challenge.DATA.id = "cm_mod_" .. challenge.NAME:gsub("%s+", "_") .. "_1"
    table.insert(challenge.DATA.rules.custom, { id = "cm_credit", value = challenge.DESIGNER })
    table.insert(challenge.DATA.rules.custom, { id = "cm_VERSION", value = challenge.VERSION })
    G.localization.misc.challenge_names[challenge.DATA.id] = challenge.DATA.name
  end

  -- Update version text if not released
  if not ChallengeMod.RELEASE then
    G.localization.misc.v_text.ch_c_cm_VERSION = { "{C:purple}VERSION: #1#{}" }
  end
  G.localization.misc.v_text.ch_c_cm_credit = { "Designed by: {C:green}#1#{}" }
end

-- Insert custom into the global challenges list
for _, challenge in ipairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, challenge.DATA)
end
