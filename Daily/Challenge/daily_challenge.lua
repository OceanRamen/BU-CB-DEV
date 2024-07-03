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

local daily_modifiers = {
    -- {
    --     NAME = "PLACEHOLDER",
    --     DESCRIPTION = "PLACEHOLDER",
    --     DATA = {
    --         rules = {
    --             custom = {},
    --             modifiers = {},
    --         },
    --         jokers = {},
    --         consumeables = {},
    --         vouchers = {},
    --         restrictions = {
    --             banned_cards = {},
    --             banned_tags = {},
    --             banned_other = {},
    --         },
    --     }
    -- },
}

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

  -- Helper function to merge lists
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

  -- Merge the DATA fields
  mergedData.rules.custom = mergeLists(table1.DATA.rules.custom, table2.DATA.rules.custom)
  mergedData.rules.modifiers = mergeLists(table1.DATA.rules.modifiers, table2.DATA.rules.modifiers)
  mergedData.jokers = mergeLists(table1.DATA.jokers, table2.DATA.jokers)
  mergedData.consumeables = mergeLists(table1.DATA.consumeables, table2.DATA.consumeables)
  mergedData.vouchers = mergeLists(table1.DATA.vouchers, table2.DATA.vouchers)
  mergedData.restrictions.banned_cards =
    mergeLists(table1.DATA.restrictions.banned_cards, table2.DATA.restrictions.banned_cards)
  mergedData.restrictions.banned_tags =
    mergeLists(table1.DATA.restrictions.banned_tags, table2.DATA.restrictions.banned_tags)
  mergedData.restrictions.banned_other =
    mergeLists(table1.DATA.restrictions.banned_other, table2.DATA.restrictions.banned_other)

  return mergedData
end

local Challenge = {}
Challenge.NAME = "Daily Challenge"
Challenge.DESIGNER = "BU-CB DEV TEAM"
Challenge.DATE_CREATED = 240627 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      { id = "daily" },
      { id = "set_seed", value = generateSeed() }, -- TODO: Set up set_seed modifier.
    },
    modifiers = {

    }
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge
