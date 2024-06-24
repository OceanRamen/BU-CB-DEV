local Challenge = {}
Challenge.NAME = "Student Loan Debt"
Challenge.DESIGNER = "CampfireCollective"
Challenge.DATE_CREATED = 240610 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  name = Challenge.NAME,
  id = "cm_mod_" .. Challenge.NAME:gsub("%s+", "_") .. "_1",
  rules = {
    custom = {
      { id = "no_reward" },
      { id = "no_extra_hand_money" },
      { id = "no_interest" },
      { id = "cm_negative_interest" },
    },
    modifiers = {
      { id = "dollars", value = 15 },
    },
  },
  vouchers = {
    { id = "v_seed_money" },
    { id = "v_money_tree" },
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge