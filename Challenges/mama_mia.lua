local Challenge = {}
Challenge.NAME = "Mama Mia"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240626 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
      custom = {
        {
          id = "cm_decreasing_handsize",
          value = 1,
        },
      },
      modifiers = {
        { id = "hand_size", value = 10 },
      },
    },
    deck = {
      type = "Challenge Deck",
    },
    restrictions = {
      banned_cards = {
        { id = "j_turtle_bean" },
        { id = "j_juggler" },
        { id = "j_troubadour" },
        {
          id = "v_paint_brush",
        },
        {
          id = "v_palette",
        },
      },
  }
}

return Challenge