Tag = {}
Tag.__index = Tag

function Tag:new(name, items)
  local obj = { name = name, items = items }
  setmetatable(obj, Tag)
  return obj
end

-- Define the get_items method
function Tag:get_items(filters, hide)
  local results = {}

  -- Create a set for hide items for faster lookup
  local hide_set = {}
  if hide then
    for _, item in ipairs(hide) do
      hide_set[item] = true
    end
  end

  -- Check if filters are provided
  if filters then
    for _, filter in ipairs(filters) do
      if self.items[filter] then
        for _, item in ipairs(self.items[filter]) do
          if not hide_set[item] then
            table.insert(results, item)
          end
        end
      end
    end
  else
    -- If no filters are provided, return all items
    for _, item_list in pairs(self.items) do
      for _, item in ipairs(item_list) do
        if not hide_set[item] then
          table.insert(results, item)
        end
      end
    end
  end

  return results
end


ChallengeMod.tags = {
  money_generators = Tag:new("money_generators", {
    JOKERS = {
      "j_credit_card",
      "j_delayed_grat",
      "j_business",
      "j_egg",
      "j_faceless",
      "j_todo_list",
      "j_cloud_9",
      "j_rocket",
      "j_gift",
      "j_mail",
      "j_reserved_parking",
      "j_golden",
      "j_ticket",
      "j_rough_gem",
      "j_matador",
      "j_satellite",
    },
    TAROTS = { "c_hermit", "c_temperance" },
    SPECTRALS = { "c_immolate" },
    VOUCHERS = { "v_seed_money", "v_money_tree" },
    SKIPS = { "tag_investment", "tag_handy", "tag_garbage", "tag_skip", "tag_economy" },
  }),
  test = Tag:new("test", {
    JOKERS = {
      "j_credit_card",
    },
  }),
}

-- -- Fetch items with filters
local filtered_items = ChallengeMod.tags.money_generators:get_items({ "JOKERS", "TAROTS" })
print(table.concat(filtered_items, ", "))
-- -- Output: j_credit_card, j_delayed_grat, j_business, j_egg, j_faceless, j_todo_list, j_cloud_9, j_rocket, j_gift, j_mail, j_reserved_parking, j_golden, j_ticket, j_rough_gem, j_matador, j_satellite, c_hermit, c_temperance

-- -- -- Fetch items with filters and hide a specific item
local filtered_hidden_items = ChallengeMod.tags.money_generators:get_items({ "JOKERS" }, {"j_credit_card"})
print(table.concat(filtered_hidden_items, ", "))
-- -- Output: j_delayed_grat, j_business, j_egg, j_faceless, j_todo_list, j_cloud_9, j_rocket, j_gift, j_mail, j_reserved_parking, j_golden, j_ticket, j_rough_gem, j_matador, j_satellite

-- Function to format items as Lua table entries
function format_items(items)
  local formatted_items = {}
  for _, item in ipairs(items) do
    table.insert(formatted_items, { id = item })
  end
  return formatted_items
end
