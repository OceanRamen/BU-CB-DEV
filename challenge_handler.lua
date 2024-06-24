local lovely = require("lovely")
local nativefs = require("nativefs")
ChallengeMod.PATH = lovely.mod_dir .. "/ChallengeMod/"

function inspectDepth(table, indent, depth)
  if depth and depth > 5 then -- Limit the depth to avoid deep nesting
    return "Depth limit reached"
  end

  if type(table) ~= "table" then -- Ensure the object is a table
    return "Not a table"
  end

  local str = ""
  if not indent then
    indent = 0
  end

  for k, v in pairs(table) do
    local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
    if type(v) == "table" then
      str = str .. formatting .. "\n"
      str = str .. inspectDepth(v, indent + 1, (depth or 0) + 1)
    elseif type(v) == "function" then
      str = str .. formatting .. "function\n"
    elseif type(v) == "boolean" then
      str = str .. formatting .. tostring(v) .. "\n"
    else
      str = str .. formatting .. tostring(v) .. "\n"
    end
  end

  return str
end

local function inspect(table)
  if type(table) ~= "table" then
    return "Not a table"
  end

  local str = ""
  for k, v in pairs(table) do
    local valueStr = type(v) == "table" and "table" or tostring(v)
    str = str .. tostring(k) .. ": " .. valueStr .. "\n"
  end

  return str
end

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
  print(inspectDepth(challenge))
  table.insert(CustomChallenges, challenge)
end

-- print(inspectDepth(CustomChallenges))
table.sort(CustomChallenges, function(a, b)
  return a.DATE_CREATED < b.DATE_CREATED
end)

function ChallengeMod.localizeChalNames()
  for i, v in ipairs(CustomChallenges) do
    table.insert(v.DATA.rules.custom, {id="cm_credit", value=v.DESIGNER})
    G.localization.misc.challenge_names[v.DATA.id] = v.DATA.name
  end
  G.localization.misc.v_text.ch_c_cm_credit = { "Designed by: {C:green}#1#{}" }
end

for i, v in pairs(CustomChallenges) do
  table.insert(G.CHALLENGES, #G.CHALLENGES + 1, v.DATA)
end
