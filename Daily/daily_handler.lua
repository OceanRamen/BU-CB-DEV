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

local daily_directory = ChallengeMod.PATH .. "Daily/Challenge/"
local daily_lua_files = get_chal_files(daily_directory)
local DailyChallenges = {}

-- Load daily challenges
for _, file in ipairs(daily_lua_files) do
  local file_path = daily_directory .. "/" .. file
  local challenge = dofile(file_path)
  table.insert(DailyChallenges, challenge)
end

-- Sort daily challenges by creation date
table.sort(DailyChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

--- Fetches the score file for daily challenges.
-- @return 1 if the score file was successfully loaded, 0 otherwise.
function ChallengeMod.DAILY.fetch_score_file()
  local score_file_path = ChallengeMod.PATH .. "saved_scores.lua"
  if nativefs.getInfo(score_file_path) then
    local score_file = STR_UNPACK(nativefs.read(score_file_path))
    if score_file ~= nil then
      ChallengeMod.DAILY.scores = score_file
      return 1
    end
  else
    return 0
  end
end

--- Gets the score for a specific date.
-- @param date The date to get the score for.
-- @return The score for the given date, or 0 if no score exists.
function ChallengeMod.DAILY.get_score(date)
  ChallengeMod.DAILY.fetch_score_file()
  return ChallengeMod.DAILY.scores[date] or 0
end

--- Writes the score for a specific date.
-- @param score The score to write.
-- @param date The date to write the score for.
function ChallengeMod.DAILY.write_score(score, date)
  ChallengeMod.DAILY.scores[date] = score
  local score_file_path = ChallengeMod.PATH .. "saved_scores.lua"
  if nativefs.getInfo(score_file_path) then
    assert(nativefs.write(score_file_path, STR_PACK(ChallengeMod.DAILY.scores)), "Failed to write to saved_scores.lua")
  end
end

--- Updates the challenge text with the current date and score.
function ChallengeMod.DAILY.update_challenge_text()
  if G.CHALLENGES then
    local displayed_date = G.CHALLENGES[1].rules.custom[2].value
    local current_date = ChallengeMod.DAILY.DATE.current_date
    if displayed_date < current_date then
      G.CHALLENGES[1].rules.custom[2].value = current_date
    end
    G.CHALLENGES[1].rules.custom[1].value = ChallengeMod.DAILY.get_score(current_date)
  end
end

--- Localizes the challenge names and updates their data.
function ChallengeMod.localizeDailyNames()
  local date = ChallengeMod.DAILY.DATE.get_current_date()
  local daily_score = ChallengeMod.DAILY.get_score(date)

  -- Localize daily challenges
  for _, challenge in ipairs(DailyChallenges) do
    challenge.DATA.name = challenge.NAME
    challenge.DATA.id = "cm_mod_" .. challenge.NAME:gsub("%s+", "_") .. "_1"
    G.localization.misc.challenge_names[challenge.DATA.id] = challenge.DATA.name
    -- table.insert(challenge.DATA.rules.custom, { id = "cm_daily_score", value = daily_score })
    table.insert(challenge.DATA.rules.custom, { id = "cm_daily_date", value = date })
  end
  

  -- Update localization text
  
  G.localization.misc.v_text.ch_c_cm_daily_date = { "Daily Challenge: {C:pale_green}#1#{}" }
--   G.localization.misc.v_text.ch_c_cm_daily_score = daily_score and { "Best Score: {c:attention}#1#{}" }
--     or { "Complete the Daily Challenge for your score!" }
  G.localization.misc.v_text.ch_c_dm_modifier_name = { "Daily Modifiers: {C:attention}#1#{} & {C:attention}#2#{}" }
end

for _, challenge in ipairs(DailyChallenges) do
  table.insert(G.CHALLENGES, 1, challenge.DATA)
end
