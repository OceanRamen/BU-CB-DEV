local Challenge = {}
Challenge.NAME = "Platinum Stake"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240614 -- Y/M/D
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
      { id = "enable_rentals_in_shop" },
      { id = "enable_eternals_in_shop" },
      { id = "enable_perishables_in_shop" },
      { id = "no_reward_specific", value = "Small" },
    },
    modifiers = {
      { id = "discards", value = 2 },
      { id = "hands", value = 3 },
      { id = "hand_size", value = 7 },
    },
  },
  deck = {
    type = "Abandoned Deck",
  },
}

return Challenge