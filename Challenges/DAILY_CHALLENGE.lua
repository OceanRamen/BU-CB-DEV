dailyModifiers = {
    {name = "High Stakes", desc = "All Blinds require {c:chips}25%{} more chips to defeat"},
    {name = "Short Stack", desc = "Start with only 1 discard, but you receive {c:money}$3{} for each remaining hand."},
    {name = "Poker Pro", desc = "Start with a {c:booster}Mega Buffoon Pack{}"},
    {name = "Big Boss", desc = "Boss Blinds are {c:attention}2x{} as big"},
    {name = "Early Bird", desc = "{c:attention}+1{} Hand Size for the first 3 Antes, then {c:attention}-2 Hand Size"},
    {name = "Card Shark", desc = "By default, no consumables appear in shops. {c:voucher}Tarot Merchant{} and {c:voucher} Planet Merchant{} restores their respective consumables ability to show up"},
    {name = "Saving Spree", desc = "At the end of an Ante, Earn an extra {c:money}$2{} per hand for each hand not played in the previous Ante"},
    {name = "Blinding Speed", desc = "Small and Big Blinds must be completed within a limited number of hands"},
    {name = "All in", desc = "Start with {c:attention}3{} extra Joker slots, but lose {c:money}$2{} for each hand played"},
    {name = "All money earned from defeating blinds is {c:attention}doubled{}, {c:attention}-1 hand size"},
    {name = "Tag Frenzy", desc = "Skipping Small and Big Blinds grants {c:attention}2{} tags instead of 1"},
    {name = "Second Wind", desc = "Start with {c:attention}Mr Bones{}, and earn {c:money}$20{} if he saves you"},
    {name = "Cash Flow", desc = "Every {c:money}$10{} you have {c:attention} decreases your maximum discards by {c:attention}1{}, but you start with {c:attention}5{} discards"},
    {name = "Buy One Get ONe Free", desc = "Start with {c:voucher}Overstock{} and {c:voucher}Clearance Sale{}"},
    {name = "All Up Front",  desc = "Start with {c:money}$100{}, but you earn no income from defeating blinds"},
    {name = "Cork Board", desc = "All Jokers are {c:attention}Pinned{}"},
    {name = "Positivity", desc = "Gain a {c:eternal}Negative Tag{} after defeating each Boss Blind"},
    {name = "Jack Of All Trades", desc = "Start with {c:secondary_set.planet}1{} level on each hand, but Planet cards are removed from the shop"},
    {name = "Dieting", desc = "Start with {c:attention}1{} less suit"},
    {name = "Headstart", desc = "Start with {c:voucher}Heiroglyph{}"},
    {name= "Risky Draw", desc = "{c:attention}-3{} hand size at the start of each round. Gain {c:attention}+1{} for each hand played. Resets after the round"},
    {name = "Moving Day", desc = "{c:booster}Booster Packs{} can now show up in regular shop slots"},
}

-- TODO: Seperate "Gold Stake" version of the Daily Challenge.

function generateSeed()
  local date = os.date("!*t")
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

-- Hash function for converting alphaneumerical string to neumerical seed for math.randomseed() use.
function stringToSeed(str)
  local seed = 0
  for i = 1, #str do
    seed = seed + string.byte(str, i)
  end
  return seed
end

function setSeed(seed)
  math.randomseed(seed)
end

function getRandomElement(list)
  return list[math.random(#list)]
end

-- Function to generate challenge modifiers
function generateModifiers(seed)
  setSeed(seed)

  -- Baseline values to ensure a certain level of difficulty
  local baseline = {
    handsize = 8,
    money = 5,
    consumableSlots = 2,
    hands = 4,
    discards = 3,
    rerollCost = 5,
    jokerSlots = 5,
  }

  -- Variability ranges around the baseline
  local ranges = {
    handsize = { 5, 10 },
    money = { 5, 30 },
    consumableSlots = { 0, 3 },
    hands = { 1, 7 },
    discards = { 0, 6 },
    rerollCost = { 1, 50 },
    jokerSlots = { 1, 10 },
  }

  local function generateValue(baseline, range)
    local min = math.max(range[1], baseline - 2)
    local max = math.min(range[2], baseline + 2)
    return math.random(min, max)
  end

  local modifiers = {
    hand_size = generateValue(baseline.handsize, ranges.handsize),
    dollars = generateValue(baseline.money, ranges.money),
    consumable_slots = generateValue(baseline.consumableSlots, ranges.consumableSlots),
    hands = generateValue(baseline.hands, ranges.hands),
    discards = generateValue(baseline.discards, ranges.discards),
    reroll_cost = generateValue(baseline.rerollCost, ranges.rerollCost),
    joker_slots = generateValue(baseline.jokerSlots, ranges.jokerSlots),
  }

  return modifiers
end

local seed = stringToSeed(generateSeed())
local generatedModifiers = generateModifiers(seed)

local challengeModifiers = {}
for key, value in pairs(generatedModifiers) do
  table.insert(challengeModifiers, { id = key, value = value })
end

local Challenge = {}
Challenge.NAME = "Daily Challenge"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240627 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      { id = "daily" },
      { id = "set_seed", value = generateSeed() }, -- TODO: Set up set_seed modifier.
    },
    modifiers = challengeModifiers,
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge
