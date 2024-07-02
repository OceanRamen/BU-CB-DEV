local Challenge = {}
Challenge.NAME = "Highroll"
Challenge.DESIGNER = "Cheerio1101"
Challenge.DATE_CREATED = 240614 -- Y/M/D
Challenge.VERSION = "1.0.1"
Challenge.DATA = {
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
    banned_cards = {
      { id = 'v_reroll_surplus' },
      { id = 'v_reroll_glut' },
      { id = 'j_chaos' },
    },
    banned_tags = {
      { id = 'tag_d_six' },
    },
    banned_other = {},
  },
}
return Challenge