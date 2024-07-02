local Challenge = {}
Challenge.NAME = "Budgeting"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240610 -- Y/M/D
Challenge.VERSION = "1.0.1"
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
      { id = "j_gift" },
      { id = "j_mail" },
      { id = "j_rough_gem" },
      { id = "j_satellite" },
      { id = "j_todo_list" },
      { id = "j_certificate" },
      { id = "c_temperance" },
      { id = "c_hermit" },
      { id = "c_devil" },
      { id = "c_immolate" },
      { id = "c_talisman" },
    },
    banned_tags = {
      { id = "tag_investment" },
      { id = "tag_economy" },
      { id = "tag_handy" },
      { id = "tag_garbage" },
      { id = "tag_speed" },
    },
    banned_other = {},
  },
}

return Challenge