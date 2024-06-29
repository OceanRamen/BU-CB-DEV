
function generateSeed()
  local date = os.date("*t")
  local dateString = string.format("%04d%02d%02d", date.year, date.month, date.day)
  math.randomseed(tonumber(dateString))
  local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local length = 8
  local result = ""
  for i = 1, length do
    local index = math.random(1, #chars)
    result = result .. chars:sub(index, index)
  end
  return result
end

local Challenge = {}
Challenge.NAME = "Daily Challenge"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240627 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {id = "daily"},
      {id = "set_seed", value = generateSeed()},
    },
    modifiers = {},
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge
