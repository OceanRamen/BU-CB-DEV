local Challenge = {}
Challenge.NAME = "Pay-As-You-Go"
Challenge.DESIGNER = "theQial"
Challenge.DATE_CREATED = 240612 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  name = Challenge.NAME,
  id = "cm_mod_" .. Challenge.NAME:gsub("%s+", "_") .. "_1",
  rules = {
    custom = {
      { id = "all_rental" },
    },
    modifiers = {
      { id = "dollars", value = 15 },
      { id = "discards", value = 4 },
    },
  },
  vouchers = {
    { id = "v_seed_money" },
    { id = "v_money_tree" },
  },
  jokers = { {
    id = "j_credit_card",
    edition = "negative",
    eternal = true,
    rental = false,
  } },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {},
    banned_tags = {},
    banned_other = {},
  },
}
