local Challenge = {}
Challenge.NAME = "Budgeting"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240610 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      { id = "no_reward" },
      { id = "no_extra_hand_money" },
      { id = "no_interest" },
    },
    modifiers = {
      { id = "dollars", value = 100 },
    },
  },
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "v_seed_money" },
      { id = "v_money_tree" },
      { id = "j_golden" },
      { id = "j_business" },
      { id = "j_egg" },
      { id = "j_riff_raff" },
      { id = "j_ticket" },
      { id = "j_faceless" },
      { id = "j_delayed_grat" },
      { id = "j_cloud_9" },
      { id = "j_midas_mask" },
      { id = "j_gift_card" },
      { id = "j_mail" },
      { id = "j_rough_gem" },
      { id = "j_satellite" },
      { id = "c_temperence" },
      { id = "c_hermit" },
    },
    banned_tags = {
      { id = "tag_investment" },
      { id = "tag_economy" },
    },
    banned_other = {},
  },
}

return Challenge