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

local chal_directory = ChallengeMod.PATH .. "Challenges/"

local chal_lua_files = get_chal_files(chal_directory)

local CustomChallenges = {}

for _, file in ipairs(chal_lua_files) do
  local file_path = chal_directory .. "/" .. file
  local challenge = dofile(file_path)
  table.insert(CustomChallenges, challenge)
end

table.sort(CustomChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

local daily_directory = ChallengeMod.PATH .. "Daily/"

local daily_lua_files = get_chal_files(daily_directory)

local DailyChallenges = {}

for _, file in ipairs(daily_lua_files) do
  local file_path = daily_directory .. "/" .. file
  local challenge = dofile(file_path)
  table.insert(DailyChallenges, challenge)
end

table.sort(DailyChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

function ChallengeMod.DAILY.fetch_score_file() 
  if nativefs.getInfo(ChallengeMod.PATH .. "saved_scores.lua") then
    local score_file = STR_UNPACK(nativefs.read((ChallengeMod.PATH .. "saved_scores.lua")))
    if score_file ~= nil then
      ChallengeMod.DAILY.scores = score_file
      return 1
    end
  else
    return 0
  end
end

function ChallengeMod.DAILY.get_score(date)
  ChallengeMod.DAILY.fetch_score_file()
  if ChallengeMod.DAILY.scores[date] then
    return ChallengeMod.DAILY.scores[date]
  else
    return 0
  end
end

function ChallengeMod.DAILY.write_score(score, date)
  ChallengeMod.DAILY.scores[date] = score
  if nativefs.getInfo(ChallengeMod.PATH .. "saved_scores.lua") then
    assert(nativefs.write(ChallengeMod.PATH .. "saved_scores.lua", STR_PACK(ChallengeMod.DAILY.scores)), "Failed to write to saved_scores.lua")
  end
end

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

function ChallengeMod.localizeChalNames()
  local date = ChallengeMod.DAILY.DATE.get_current_date()
  local daily_score = ChallengeMod.DAILY.get_score(date)
  for i, v in ipairs(DailyChallenges) do
    v.DATA.name = v.NAME
    v.DATA.id = "cm_mod_" .. v.NAME:gsub("%s+", "_") .. "_1"
    G.localization.misc.challenge_names[v.DATA.id] = v.DATA.name
    table.insert(v.DATA.rules.custom, { id = "cm_daily_score", value = daily_score })
    table.insert(v.DATA.rules.custom, { id = "cm_daily_date", value = date})
  end
  G.localization.misc.v_text.ch_c_cm_daily_date = {"Daily Challenge: {c:attention}#1#{}"}
  if not daily_score then 
    G.localization.misc.v_text.ch_c_cm_daily_score = { "Complete the Daily Challenge for your score!"}
  else
    G.localization.misc.v_text.ch_c_cm_daily_score = { "Best Score: {c:attention}#1#{}" }
  end
  for i, v in ipairs(CustomChallenges) do
    v.DATA.name = v.NAME
    v.DATA.id = "cm_mod_" .. v.NAME:gsub("%s+", "_") .. "_1"
    table.insert(v.DATA.rules.custom, { id = "cm_credit", value = v.DESIGNER })
    table.insert(v.DATA.rules.custom, { id = "cm_VERSION", value = v.VERSION })
    G.localization.misc.challenge_names[v.DATA.id] = v.DATA.name
  end
  if not ChallengeMod.RELEASE then
    G.localization.misc.v_text.ch_c_cm_VERSION = { "{C:purple}VERSION: #1#{}" }
  end
  G.localization.misc.v_text.ch_c_cm_credit = { "Designed by: {C:green}#1#{}" }
end



for i, v in pairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v.DATA)
end
for i, v in pairs(DailyChallenges) do
  table.insert(G.CHALLENGES, 1, v.DATA)
end
