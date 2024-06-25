local Challenge = {}
Challenge.NAME = "Riff-Raffle"
Challenge.DESIGNER = "UppedHealer8521"
Challenge.DATE_CREATED = 240607 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {
        id = "no_reward",
      },
      {
        id = "no_extra_hand_money",
      },
      {
        id = "no_interest",
      },
      {
        id = "no_shop_jokers",
      },
    },
    modifiers = {
      {
        id = "dollars",
        value = 0,
      },
      {
        id = "discards",
        value = 3,
      },
      {
        id = "hands",
        value = 4,
      },
      {
        id = "reroll_cost",
        value = 5,
      },
      {
        id = "joker_slots",
        value = 5,
      },
      {
        id = "consumable_slots",
        value = 2,
      },
      {
        id = "hand_size",
        value = 8,
      },
    },
  },
  jokers = { {
    id = "j_riff_raff",
    edition = "negative",
    eternal = true,
  } },
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {
        id = "c_judgement",
      },
      {
        id = "c_wraith",
      },
      {
        id = "c_ankh",
      },
      {
        id = "c_soul",
      },
      {
        id = "p_buffoon_normal_1",
        ids = { "p_buffoon_normal_1", "p_buffoon_normal_2", "p_buffoon_jumbo_1", "p_buffoon_mega_1" },
      },
      {
        id = "v_seed_money",
      },
      {
        id = "v_money_tree",
      },
      {
        id = "j_golden",
      },
      {
        id = "j_business",
      },
      {
        id = "j_egg",
      },
      {
        id = "j_riff_raff",
      },
      {
        id = "j_ticket",
      },
      {
        id = "j_faceless",
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
