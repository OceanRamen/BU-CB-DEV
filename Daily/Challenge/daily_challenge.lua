--- Generates a seed based on the current date for randomization.
-- @return A alpha-numerical seed generated from the current date.
function generateSeed()
  local date = os.date("!*t")
  local dateString = string.format("%04d%02d%02d", date.year, date.month, date.day)
  math.randomseed(tonumber(dateString))
  local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local length = 8
  local result = ""
  for i = 1, length do
    local index = math.random(1, #chars)
    result = result .. chars:sub(index, index)
  end
  return result
end

--- Converts a string into a numerical seed for math.randomseed().
-- @param str The string to convert into a seed.
-- @return The numerical seed generated from the string.
function stringToSeed(str)
  local seed = 0
  for i = 1, #str do
    seed = seed + string.byte(str, i) -- Sum ASCII values of characters
  end
  return seed
end

--- Sets the random seed for math.random().
-- @param seed The seed value to set for randomization.
function setSeed(seed)
  math.randomseed(seed)
end

--- Retrieves a random element from a list.
-- @param list The list of elements to choose from.
-- @param id Boolean indicating if index should be returned instead of element.
-- @return A randomly selected element from the list or its index.
function getRandomElement(list, id)
  local rand = math.random(#list)
  if id then
    return rand
  else
    return list[rand]
  end
end

--- Retrieves a random selection of daily modifiers.
-- @param daily_modifiers The table containing daily modifiers.
-- @param num_modifiers The number of modifiers to select.
-- @return A table containing randomly chosen daily modifiers.
function getDailyModifiers(daily_modifiers, num_modifiers)
  local modifier_pool = {} -- Copy of daily_modifiers to modify
  for _, v in ipairs(daily_modifiers) do
    table.insert(modifier_pool, v)
  end

  local chosen_modifiers = {}
  for i = 1, num_modifiers do
    local chosen_id = getRandomElement(modifier_pool, true)
    local chosen_mod = table.remove(modifier_pool, chosen_id)
    table.insert(chosen_modifiers, chosen_mod)
  end

  return chosen_modifiers
end

--- Merges two lists into a single list.
-- @param list1 The first list to merge.
-- @param list2 The second list to merge.
-- @return A merged list containing elements from both input lists.
local function mergeLists(list1, list2)
  local result = {}
  for _, item in ipairs(list1) do
    table.insert(result, item)
  end
  for _, item in ipairs(list2) do
    table.insert(result, item)
  end
  return result
end

--- Merges the DATA fields of two tables.
-- @param table1 The first table with DATA fields.
-- @param table2 The second table with DATA fields.
-- @return A new table containing the combined DATA fields.
function mergeDataFields(table1, table2)
  local mergedData = {
    rules = {
      custom = {},
      modifiers = {},
    },
    jokers = {},
    consumeables = {},
    vouchers = {},
    restrictions = {
      banned_cards = {},
      banned_tags = {},
      banned_other = {},
    },
  }

  -- Merge the DATA fields from table1 and table2 into mergedData
  mergedData.rules.custom = mergeLists(table1.rules.custom, table2.rules.custom)
  mergedData.rules.modifiers = mergeLists(table1.rules.modifiers, table2.rules.modifiers)
  mergedData.jokers = mergeLists(table1.jokers, table2.jokers)
  mergedData.consumeables = mergeLists(table1.consumeables, table2.consumeables)
  mergedData.vouchers = mergeLists(table1.vouchers, table2.vouchers)
  mergedData.restrictions.banned_cards = mergeLists(table1.restrictions.banned_cards, table2.restrictions.banned_cards)
  mergedData.restrictions.banned_tags = mergeLists(table1.restrictions.banned_tags, table2.restrictions.banned_tags)
  mergedData.restrictions.banned_other = mergeLists(table1.restrictions.banned_other, table2.restrictions.banned_other)

  return mergedData
end

-- List of available decks
local decks = {
  "Red Deck",
  "Blue Deck",
  "Yellow Deck",
  "Green Deck",
  "Black Deck",
  "Magic Deck",
  "Nebula Deck",
  "Ghost Deck",
  "Abandoned Deck",
  "Checkered Deck",
  "Zodiac Deck",
  "Painted Deck",
  "Anaglyph Deck",
  "Plasma Deck",
  "Erratic Deck",
  "Challenge Deck",
}

-- Select a random deck
local daily_deck = decks[getRandomElement(decks, true)]

-- Determine the overstock modifier based on the selected deck
local buy_one_get_one_free_overstock = "v_overstock_norm"
if daily_deck == "Zodiac Deck" then
  buy_one_get_one_free_overstock = "v_overstock_plus"
end

-- Daily modifiers configuration
local daily_modifiers = {
  {
    NAME = "PLACEHOLDER",
    DESCRIPTION = "PLACEHOLDER",
    DATA = {
      rules = {
        custom = {},
        modifiers = {},
      },
      jokers = {},
      consumeables = {},
      vouchers = {},
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
  {
    NAME = "Buy One Get One Free",
    DESCRIPTION = "Start with {c:voucher}Overstock{} and {c:voucher}Clearance Sale{}",
    DATA = {
      rules = {
        custom = {},
        modifiers = {},
      },
      jokers = {},
      consumeables = {},
      vouchers = {
        { id = buy_one_get_one_free_overstock },
        { id = "v_clearance_sale" },
      },
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
  {
    NAME = "High Stakes",
    DESCRIPTION = "All Blinds require {c:chips}25%{} more chips to defeat",
    DATA = {
      rules = {
        custom = { { id = "cm_all_blind_increase", value = 1.25, hidden = true } },
        modifiers = {},
      },
      jokers = {},
      consumeables = {},
      vouchers = {},
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
  {
    NAME = "Short Stack",
    DESCRIPTION = "Start with only 1 discard, but you receive {c:money}$3{} for each remaining hand.",
    DATA = {
      rules = {
        custom = {
            { id = "dm_dollars_per_hand", value = 3, hidden = true},
        },
        modifiers = {
          { id = "discards", value = 1 },
        },
      },
      jokers = {},
      consumeables = {},
      vouchers = {},
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
  {
    NAME = "Big Boss",
    DESCRIPTION = "Boss Blinds are {c:attention}2x{} as big",
    DATA = {
      rules = {
        custom = { { id = "dm_boss_increase", value = 2, hidden = true} },
        modifiers = {},
      },
      jokers = {},
      consumeables = {},
      vouchers = {},
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
  {
    NAME = "Early Bird",
    DESCRIPTION = "{c:attention}+1{} Hand Size for the first 3 Antes, then {c:attention}-2 Hand Size",
    DATA = {
      rules = {
        custom = { { id = "dm_ante_handsize_change", value = 3, hidden = true } },
        modifiers = { { id = "hand_size", value = 6 } },
      },
      jokers = {},
      consumeables = {},
      vouchers = {},
      restrictions = {
        banned_cards = {},
        banned_tags = {},
        banned_other = {},
      },
    },
  },
}

-- Define the Daily Challenge object
local Challenge = {
  NAME = "Daily Challenge",
  DESIGNER = "BU-CB DEV TEAM",
  DATE_CREATED = 240627, -- Y/M/D
  VERSION = "1.0.0",
  DATA = {
    rules = {
      custom = {
        { id = "daily" },
        { id = "set_seed", value = generateSeed() },
      },
      modifiers = {},
    },
    jokers = {},
    consumeables = {},
    vouchers = {},
    restrictions = {
      banned_cards = {},
      banned_tags = {},
      banned_other = {},
    },
  },
}

-- Get two random daily modifiers
local dailyMods = getDailyModifiers(daily_modifiers, 2)

-- Print the selected daily modifiers for inspection
print("Selected Daily Modifiers:")
for _, mod in ipairs(dailyMods) do
  print(mod.NAME)
end

-- Merge the DATA fields of the two selected modifiers into Challenge DATA
local mergedMods = mergeDataFields(dailyMods[1].DATA, dailyMods[2].DATA)
Challenge.DATA.rules.custom = mergeLists(Challenge.DATA.rules.custom, mergedMods.rules.custom)
Challenge.DATA.rules.modifiers = mergeLists(Challenge.DATA.rules.modifiers, mergedMods.rules.modifiers)
Challenge.DATA.jokers = mergeLists(Challenge.DATA.jokers, mergedMods.jokers)
Challenge.DATA.consumeables = mergeLists(Challenge.DATA.consumeables, mergedMods.consumeables)
Challenge.DATA.vouchers = mergeLists(Challenge.DATA.vouchers, mergedMods.vouchers)
Challenge.DATA.restrictions.banned_cards =
  mergeLists(Challenge.DATA.restrictions.banned_cards, mergedMods.restrictions.banned_cards)
Challenge.DATA.restrictions.banned_tags =
  mergeLists(Challenge.DATA.restrictions.banned_tags, mergedMods.restrictions.banned_tags)
Challenge.DATA.restrictions.banned_other =
  mergeLists(Challenge.DATA.restrictions.banned_other, mergedMods.restrictions.banned_other)

-- Assign the selected daily deck to Challenge DATA
Challenge.DATA.deck = {
  type = daily_deck,
}

table.insert(Challenge.DATA.rules.custom, 2, {id = "dm_modifier_name", value = dailyMods[1].NAME, name = dailyMods[2].NAME})
-- Return the finalized Challenge object
return Challenge
