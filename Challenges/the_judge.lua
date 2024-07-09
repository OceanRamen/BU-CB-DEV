local Challenge = {}
Challenge.NAME = "The Judge"
Challenge.DESIGNER = "BERSERK"
Challenge.DATE_CREATED = 240708 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    modifiers = { {
      id = "joker_slots",
      value = 5,
    } },
    custom = {
      {
        id = "no_shop_jokers",
      },
      {
        id = "all_eternal",
      },
    },
  },
  consumeables = {
    { id = "c_judgement" },
  },
  restrictions = {
    banned_cards = {
      { id = "j_ceremonial" },
      { id = "j_gros_michel" },
      { id = "j_cavendish" },
      { id = "j_ice_cream" },
      { id = "j_luchador" },
      { id = "j_turtle_bean" },
      { id = "j_diet_cola" },
      { id = "j_popcorn" },
      { id = "j_ramen" },
      { id = "j_selzer" },
      { id = "j_mr_bones" },
      { id = "j_invisible" },
      { id = "j_shortcut" },
      { id = "j_four_fingers" },
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
    banned_other = {
      { id = "bl_final_leaf", type = "blind" },
    },
  },
  deck = {
    cards = {
      { s = "D", r = "A" },
      { s = "D", r = "2" },
      { s = "D", r = "3" },
      { s = "D", r = "4" },
      { s = "D", r = "6" },
      { s = "D", r = "7" },
      { s = "D", r = "8" },
      { s = "D", r = "9" },
      { s = "D", r = "J" },
      { s = "D", r = "Q" },
      { s = "D", r = "K" },
      { s = "C", r = "A" },
      { s = "C", r = "2" },
      { s = "C", r = "3" },
      { s = "C", r = "4" },
      { s = "C", r = "6" },
      { s = "C", r = "7" },
      { s = "C", r = "8" },
      { s = "C", r = "9" },
      { s = "C", r = "J" },
      { s = "C", r = "Q" },
      { s = "C", r = "K" },
      { s = "H", r = "A" },
      { s = "H", r = "2" },
      { s = "H", r = "3" },
      { s = "H", r = "4" },
      { s = "H", r = "6" },
      { s = "H", r = "7" },
      { s = "H", r = "8" },
      { s = "H", r = "9" },
      { s = "H", r = "J" },
      { s = "H", r = "Q" },
      { s = "H", r = "K" },
      { s = "S", r = "A" },
      { s = "S", r = "2" },
      { s = "S", r = "3" },
      { s = "S", r = "4" },
      { s = "S", r = "6" },
      { s = "S", r = "7" },
      { s = "S", r = "8" },
      { s = "S", r = "9" },
      { s = "S", r = "J" },
      { s = "S", r = "Q" },
      { s = "S", r = "K" },
    },
    type = "Challenge Deck",
  },
}

return Challenge
