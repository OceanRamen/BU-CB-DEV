local Challenge = {}
Challenge.NAME = "Test Challenge"
Challenge.DESIGNER = "USERNAME"
Challenge.DATE_CREATED = 240624 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  name = Challenge.NAME,
  id = "cm_mod_" .. Challenge.NAME:gsub("%s+", "_") .. "_1",
  rules = {
    custom = {
      {
        id = "cm_scaling",
        value = {
          300,
          1800,
          5760,
          16200,
          45000,
          108000,
          198000,
          360000,
        },
      },
    },
    modifiers = {
    },

  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge