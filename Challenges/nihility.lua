local Challenge = {}
Challenge.NAME = "Nihility"
Challenge.DESIGNER = "ascriptmaster"
Challenge.DATE_CREATED = 240703 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {id = 'cm_debuff_cards'},
    },
    modifiers = {
      {id = 'dollars', value = 8},
    },
  },
  jokers = {
    {id = 'j_joker'},
  },
  consumeables = {},
  vouchers = {
  },
  deck = {
    type = 'Challenge Deck',
  },
  restrictions = {
    banned_cards = {
      -- Basically ban any joker that affects cards
      {id = 'j_8_ball'},
      {id = 'j_ancient'},
      {id = 'j_arrowhead'},
      {id = 'j_baron'},
      {id = 'j_bloodstone'},
      {id = 'j_business'},
      {id = 'j_castle'},
      {id = 'j_dusk'},
      {id = 'j_even_steven'},
      {id = 'j_faceless'},
      {id = 'j_fibonacci'},
      {id = 'j_gluttenous_joker'},
      {id = 'j_greedy_joker'},
      {id = 'j_hack'},
      {id = 'j_hanging_chad'},
      {id = 'j_hiker'},
      {id = 'j_hit_the_road'},
      {id = 'j_idol'},
      {id = 'j_lusty_joker'},
      {id = 'j_mail'},
      {id = 'j_midas_mask'},
      {id = 'j_mime'},
      {id = 'j_odd_todd'},
      {id = 'j_onyx_agate'},
      {id = 'j_pareidolia'},
      {id = 'j_photograph'},
      {id = 'j_raised_fist'},
      {id = 'j_reserved_parking'},
      {id = 'j_rough_gem'},
      {id = 'j_scary_face'},
      {id = 'j_scholar'},
      {id = 'j_seeing_double'},
      {id = 'j_selzer'},
      {id = 'j_shoot_the_moon'},
      {id = 'j_smiley'},
      {id = 'j_sock_and_buskin'},
      {id = 'j_splash'},
      {id = 'j_ticket'},
      {id = 'j_triboulet'},
      {id = 'j_vampire'},
      {id = 'j_walkie_talkie'},
      {id = 'j_wee'},
      {id = 'j_wrathful_joker'},
    },
    banned_tags = {
    },
    banned_other = {
      {id = 'bl_club', type = 'blind'},
      {id = 'bl_goad', type = 'blind'},
      {id = 'bl_head', type = 'blind'},
      {id = 'bl_plant', type = 'blind'},
      {id = 'bl_window', type = 'blind'},
      {id = 'bl_pillar', type = 'blind'},
      {id = 'bl_final_leaf', type = 'blind'},
    },
  },
}

return Challenge