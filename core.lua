ChallengeMod = {}
function initChallenges()
  local lovely = require("lovely")
  local nativefs = require("nativefs")
  ChallengeMod.PATH = lovely.mod_dir .. "/BU-CB/"
  assert(load(nativefs.read(ChallengeMod.PATH .. "challenge_handler.lua")))()
  assert(load(nativefs.read(ChallengeMod.PATH .. "mechanics.lua")))()
end

ChallengeMod.RELEASE = false
ChallengeMod.VERSION = "BU-CB-" .. "1.0.0" .. "-" .. (ChallengeMod.RELEASE and "FULL" or "DEV")

function ChallengeMod.draw()
  if not ChallengeMod.RELEASE then
    love.graphics.push()
    love.graphics.setColor(G.C.WHITE)
    love.graphics.print(ChallengeMod.VERSION, 10, 30)
    love.graphics.pop()
  end
end

ChallengeMod.Helper = {}
function ChallengeMod.Helper.inspectDepth(table, indent, depth)
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

function ChallengeMod.Helper.inspect(table)
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
