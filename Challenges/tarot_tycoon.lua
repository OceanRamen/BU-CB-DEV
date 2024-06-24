local Challenge = {}
Challenge.NAME = "Tarot Tycoon"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240607 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  name = Challenge.NAME,
  id = "cm_mod_" .. Challenge.NAME:gsub("%s+", "_") .. "_1",
  rules = {
    custom = {
      { id = "no_shop_jokers" },
      { id = "no_shop_planets" },
    },
    modifiers = {},
  },
  jokers = {},
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
      },
      {
        id = "p_celestial_normal_1",
        ids = {
          "p_celestial_normal_1",
          "p_celestial_normal_2",
          "p_celestial_normal_3",
          "p_celestial_normal_4",
          "p_celestial_jumbo_1",
          "p_celestial_jumbo_2",
          "p_celestial_mega_1",
          "p_celestial_mega_2",
        },
      },
      {
        id = "v_planet_merchant",
      },
      {
        id = "v_planet_tycoon",
      },
      id = "v_tarot_merchant",
    },
    {
      id = "v_tarot_tycoon",
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
      {
        id = "tag_meteor",
      },
    },
    banned_other = {},
  },
}

return Challenge