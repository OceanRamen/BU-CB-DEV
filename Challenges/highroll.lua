local Challenge = {}
Challenge.NAME = "Highroll"
Challenge.DESIGNER = "Cheerio1101"
Challenge.DATE_CREATED = 240614 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  name = Challenge.NAME,
  id = "cm_mod_" .. Challenge.NAME:gsub("%s+", "_") .. "_1",
  rules = {
    custom = {
    },
    modifiers = { {
      id = "reroll_cost",
      value = 150,
    } },
  },
  jokers = {},
  consumeables = {},
  vouchers = {
    { id = "v_overstock_norm" },
    { id = "v_overstock_plus" },
    { id = "v_crystal_ball" },
    { id = "v_omen_globe" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {},
    banned_tags = {},
    banned_other = {},
  },
}
return Challenge