local Challenge = {}
Challenge.NAME = "Tarot Torture"
Challenge.DESIGNER = "DrSpectred"
Challenge.DATE_CREATED = 240607 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      { id = "no_shop_jokers" },
      { id = "no_shop_planets" },
    },
    modifiers = {
      { id = "discards", value = 1 },
      { id = "hands", value = 1 },
    },
  },
  jokers = {},
  consumeables = {},
  vouchers = {
    { id = "v_crystal_ball" },
    { id = "v_omen_globe" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
      },
    },
    banned_tags = {
      {
        id = "tag_rare",
      },
      {
        id = "tag_uncommon",
      },
      {
        id = "tag_holo",
      },
      {
        id = "tag_polychrome",
      },
      {
        id = "tag_negative",
      },
      {
        id = "tag_foil",
      },
      {
        id = "tag_buffoon",
      },
    },
    banned_other = {},
  },
}

return Challenge