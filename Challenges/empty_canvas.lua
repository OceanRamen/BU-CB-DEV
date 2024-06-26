local Challenge = {}
Challenge.NAME = "Empty Canvas"
Challenge.DESIGNER = "CampfireCollective"
Challenge.DATE_CREATED = 240626
Challenge.VERSION = "1.0.1"
Challenge.DATA = {
  rules = {
    custom = {
    },
    modifiers = {
      { id = "hand_size", value = 0 },
    },
  },
  jokers = {
    {id = 'j_juggler'},
    {id = 'j_troubadour'},
    {id = 'j_turtle_bean'},
    { id = "j_ring_master", edition = 'negative'}
  },
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      {id = "v_paint_brush"},
      {id = "v_palette"},
    },
    banned_other = {
      { id = "bl_manacle", type = "blind" },
    },
  },
}

return Challenge
