ChallengeMod.Tag = {}
ChallengeMod.Tag.__index = ChallengeMod.Tag

--- Creates a new Tag instance.
-- @param name The name of the tag.
-- @param items The items associated with the tag.
-- @return A new Tag instance.
function ChallengeMod.Tag:new(name, items)
  local obj = { name = name, items = items }
  setmetatable(obj, ChallengeMod.Tag)
  return obj
end

--- Retrieves items based on filters and hides specified items.
-- @param filters A list of filters to apply.
-- @param hide A list of items to hide.
-- @return A list of filtered items.
function ChallengeMod.Tag:get_items(filters, hide)
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

--- Initializes the tags for ChallengeMod.
ChallengeMod.tags = {
  money_generators = ChallengeMod.Tag:new("money_generators", {
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
}

--- Formats items into a list of tables with an 'id' key.
-- @param items The list of items to format.
-- @return A list of formatted items.
function format_items(items)
  local formatted_items = {}
  for _, item in ipairs(items) do
    table.insert(formatted_items, { id = item })
  end
  return formatted_items
end
