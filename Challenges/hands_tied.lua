local Challenge = {}
Challenge.NAME = "Hands Tied"
Challenge.DESIGNER = "Wingcap"
Challenge.DATE_CREATED = 240617 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {
        id = "cm_hand_kills",
        value = "Straight",
      },
    },
    modifiers = {
      { id = "hands", value = 6 },
      { id = "discards", value = 0 },
    },
  },
  jokers = {
    { id = "j_shortcut", eternal = true, edition = "negative" },
    { id = "j_four_fingers", eternal = true, edition = "negative" },
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_drunkard" },
      { id = "j_merry_andy" },
      { id = "v_wasteful" },
      { id = "v_recyclomancy" },
    },
    banned_tags = {},
    banned_other = {},
  },
}

return Challenge