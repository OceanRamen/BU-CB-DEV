ChallengeMod.Tag = {}
ChallengeMod.Tag.__index = ChallengeMod.Tag

--- Creates a new Tag instance.
-- @param name The name of the tag.
-- @param items The items associated with the tag.
-- @return A new Tag instance.
function ChallengeMod.Tag:new(name, items)
  local obj = { name = name, items = items }
  setmetatable(obj, ChallengeMod.Tag)
  return obj
end

--- Retrieves items based on filters and hides specified items.
-- @param filters A list of filters to apply.
-- @param hide A list of items to hide.
-- @return A list of filtered items.
function ChallengeMod.Tag:get_items(filters, hide)
  local results = {}

  -- Create a set for hide items for faster lookup
  local hide_set = {}
  if hide then
    for _, item in ipairs(hide) do
      hide_set[item] = true
    end
  end

  -- Check if filters are provided
  if filters then
    for _, filter in ipairs(filters) do
      if self.items[filter] then
        for _, item in ipairs(self.items[filter]) do
          if not hide_set[item] then
            table.insert(results, item)
          end
        end
      end
    end
  else
    -- If no filters are provided, return all items
    for _, item_list in pairs(self.items) do
      for _, item in ipairs(item_list) do
        if not hide_set[item] then
          table.insert(results, item)
        end
      end
    end
  end

  return results
end

--- Initializes the tags for ChallengeMod.
ChallengeMod.tags = {
  -- Scoring

  --- All sources of plus chips
  plus_chips = ChallengeMod.Tag:new("plus_chips", {
    JOKERS = {
      "j_sly",
      "j_wily",
      "j_clever",
      "j_devious",
      "j_crafty",
      "j_banner",
      "j_scary_face",
      "j_odd_todd",
      "j_scholar",
      "j_runner",
      "j_ice_cream",
      "j_blue_joker",
      "j_hiker",
      "j_square",
      "j_stone",
      "j_bull",
      "j_walkie_talkie",
      "j_castle",
      "j_arrowhead",
      "j_wee",
      "j_stuntman",
    },
    TAROTS = {
      "c_heirophant",
      "c_tower",
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All sources of plus mult
  plus_mult = ChallengeMod.Tag:new("plus_mult", {
    JOKERS = {
      "j_joker",
      "j_greedy_joker",
      "j_lusty_joker",
      "j_wrathful_joker",
      "j_gluttenous_joker",
      "j_jolly",
      "j_zany",
      "j_mad",
      "j_crazy",
      "j_droll",
      "j_half",
      "j_ceremonial",
      "j_mystic_summit",
      "j_misprint",
      "j_raised_fist",
      "j_fibonacci",
      "j_abstract",
      "j_gros_michel",
      "j_even_steven",
      "j_scholar",
      "j_supernova",
      "j_ride_the_bus",
      "j_green_joker",
      "j_red_card",
      "j_erosion",
      "j_fortune_teller",
      "j_flash",
      "j_popcorn",
      "j_trousers",
      "j_walkie_talkie",
      "j_smiley",
      "j_swashbuckler",
      "j_onyx_agate",
      "j_shoot_the_moon",
      "j_bootstraps",
    },
    TAROTS = {
      "c_empress",
      "c_magician",
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All sources of plus x-mult
  x_mult = ChallengeMod.Tag:new("x_mult", {
    JOKERS = {
      "j_stencil",
      "j_loyalty_card",
      "j_steel_joker",
      "j_blackboard",
      "j_constellation",
      "j_cavendish",
      "j_card_sharp",
      "j_madness",
      "j_vampire",
      "j_hologram",
      "j_baron",
      "j_obelisk",
      "j_photograph",
      "j_lucky_cat",
      "j_baseball",
      "j_ancient",
      "j_ramen",
      "j_campfire",
      "j_acrobat",
      "j_bloodstone",
      "j_flower_pot",
      "j_idol",
      "j_seeing_double",
      "j_hit_the_road",
      "j_duo",
      "j_trio",
      "j_family",
      "j_order",
      "j_tribe",
      "j_drivers_license",
      "j_caino",
      "j_triboulet",
      "j_yorick",
    },
    TAROTS = {
      "c_chariot",
      "c_justice",
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BLINDS = {
    },
  }),

  -- Hand and jokers

  --- All possible ways to increase hands count
  plus_hands = ChallengeMod.Tag:new("plus_hands", {
    JOKERS = {
      "j_burglar",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
      "v_grabber",
      "v_nacho_tong",
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to decrease hands count
  minus_hands = ChallengeMod.Tag:new("minus_hands", {
    JOKERS = {
      "j_troubadour",
      "v_hieroglyph",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_needle",
    },
  }),
  --- All possible ways to increase discards count
  plus_discards = ChallengeMod.Tag:new("plus_discards", {
    JOKERS = {
      "j_drunkard",
      "j_merry_andy",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
      "v_wasteful",
      "v_recyclomancy",
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to decrease discards count
  minus_discards = ChallengeMod.Tag:new("minus_discards", {
    JOKERS = {
      "j_burglar",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
      "v_petroglyph",
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_water",
    },
  }),
  --- All possible ways to increase hand size
  plus_hand_size = ChallengeMod.Tag:new("plus_hand_size", {
    JOKERS = {
      "j_turtle_bean",
      "j_juggler",
      "j_troubadour",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
      "v_paint_brush",
      "v_palette",
    },
    SKIPS = {
      "tag_juggle",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_serpent"
    },
  }),
  --- All possible ways to decrease hand size
  minus_hand_size = ChallengeMod.Tag:new("minus_hand_size", {
    JOKERS = {
      "j_merry_andy",
      "j_stuntman",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_manacle",
    },
  }),
  --- All possible ways to increase joker slots count
  plus_joker_slots = ChallengeMod.Tag:new("plus_joker_slots", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
      "c_ectoplasm",
    },
    VOUCHERS = {
      "v_blank",
      "v_antimatter",
    },
    SKIPS = {
      "tag_negative",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),

  -- Money manipulation

  --- All possible ways to get money
  money_generators = ChallengeMod.Tag:new("money_generators", {
    JOKERS = {
      "j_credit_card",
      "j_delayed_grat",
      "j_business",
      "j_egg",
      "j_faceless",
      "j_todo_list",
      "j_cloud_9",
      "j_rocket",
      "j_gift",
      "j_reserved_parking",
      "j_mail",
      "j_to_the_moon",
      "j_golden",
      "j_ticket",
      "j_rough_gem",
      "j_matador",
      "j_satellite",
    },
    TAROTS = {
      "c_magician",
      "c_hermit",
      "c_temperance",
      "c_devil",
    },
    SPECTRALS = {
      "c_talisman",
      "c_immolate",
    },
    VOUCHERS = { 
      "v_seed_money",
      "v_money_tree",
    },
    SKIPS = {
      "tag_investment",
      "tag_handy",
      "tag_garbage",
      "tag_skip",
      "tag_economy",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All interest-related stuff
  money_from_interest = ChallengeMod.Tag:new("money_from_interest", {
    JOKERS = {
      "j_to_the_moon",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
      "v_seed_money",
      "v_money_tree",
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to set money to zero
  money_reset = ChallengeMod.Tag:new("money_reset", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
      "c_wraith",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_ox",
    },
  }),

  -- Cards manipulation

  --- All possible ways to find or add card to deck
  cards_generators = ChallengeMod.Tag:new("cards_generators", {
    JOKERS = {
      "j_marble",
      "j_dna",
      "j_certificate",
    },
    TAROTS = {
      -- "c_death",
    },
    SPECTRALS = {
      "c_familiar",
      "c_grim",
      "c_incantation",
      "c_cryptid",
    },
    VOUCHERS = { 
    },
    SKIPS = {
      "tag_standard",
    },
    BOOSTER_PACKS = {
      "p_standard_normal_1",
      "p_standard_normal_2",
      "p_standard_normal_3",
      "p_standard_normal_4",
      "p_standard_jumbo_1",
      "p_standard_jumbo_2",
      "p_standard_mega_1",
      "p_standard_mega_2",
    },
    BLINDS = {
    },
  }),
  --- All possible ways to make a copy of card
  cards_duplicators = ChallengeMod.Tag:new("cards_duplicators", {
    JOKERS = {
      "j_dna",
    },
    TAROTS = {
      "c_death",
    },
    SPECTRALS = {
      "c_cryptid",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to remove card from deck
  cards_destroyers = ChallengeMod.Tag:new("cards_destroyers", {
    JOKERS = {
      "j_sixth_sense",
      "j_trading",
    },
    TAROTS = {
      "c_hanged_man",
    },
    SPECTRALS = {
      "c_familiar",
      "c_grim",
      "c_incantation",
      "c_immolate",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to debuff card in hand
  cards_debuffers = ChallengeMod.Tag:new("cards_debuffers", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_club",
      "bl_goad",
      "bl_plant",
      "bl_head",
      "bl_final_leaf",
      "bl_window",
      "bl_pillar",
    },
  }),
  --- All possible ways to face down card in hand
  cards_face_down = ChallengeMod.Tag:new("cards_face_down", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_fish",
      "bl_house",
      "bl_mark",
      "bl_wheel",
    },
  }),
  --- All possible ways to change card's suit
  cards_suit_overriders = ChallengeMod.Tag:new("cards_suit_overriders", {
    JOKERS = {
      "j_smeared",
    },
    TAROTS = {
      "c_lovers",
      "c_star",
      "c_moon",
      "c_sun",
      "c_world",
    },
    SPECTRALS = {
      "c_sigil",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to change card's enchancement
  cards_enchancement_overriders = ChallengeMod.Tag:new("cards_enchancement_overriders", {
    JOKERS = {
      "j_vampire",
      "j_midas_mask",
    },
    TAROTS = {
      "c_magician",
      "c_empress",
      "c_heirophant",
      "c_lovers",
      "c_chariot",
      "c_justice",
      "c_devil",
      "c_tower",
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_fish",
      "bl_house",
      "bl_mark",
      "bl_wheel",
    },
  }),
  --- All possible ways to change card's rank
  cards_rank_overriders = ChallengeMod.Tag:new("cards_rank_overriders", {
    JOKERS = {
    },
    TAROTS = {
      "c_strength",
    },
    SPECTRALS = {
      "c_ouija"
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to retrigger card in hand or when scored
  cards_retriggers = ChallengeMod.Tag:new("cards_retriggers", {
    JOKERS = {
      "j_mime",
      "j_dusk",
      "j_hack",
      "j_selzer",
      "j_sock_and_buskin",
      "j_hanging_chad",
    },
    TAROTS = {
    },
    SPECTRALS = {
      "c_deja_vu"
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),

  -- Jokers manipulation

  --- All possible ways to find or add joker
  jokers_generators = ChallengeMod.Tag:new("jokers_generators", {
    JOKERS = {
      "j_riff_raff",
      "j_invisible",
    },
    TAROTS = {
      "c_judgement"
    },
    SPECTRALS = {
      "c_wraith",
      "c_soul",
    },
    VOUCHERS = { 
    },
    SKIPS = {
      "tag_uncommon",
      "tag_rare",
      "tag_buffoon",
      "tag_top_up",
    },
    BOOSTER_PACKS = {
      "p_buffoon_normal_1",
      "p_buffoon_normal_2",
      "p_buffoon_jumbo_1 ",
      "p_buffoon_mega_1",
    },
    BLINDS = {
    },
  }),
  --- All possible ways to make a copy of joker
  jokers_duplicators = ChallengeMod.Tag:new("jokers_duplicators", {
    JOKERS = {
      "j_invisible",
      "j_ring_master",
    },
    TAROTS = {
    },
    SPECTRALS = {
      "c_ankh",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to destroy a joker
  jokers_destroyers = ChallengeMod.Tag:new("jokers_destroyers", {
    JOKERS = {
      "j_ceremonial",
      "j_madness",
    },
    TAROTS = {
    },
    SPECTRALS = {
      "c_ankh",
      "c_hex",
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to debuff a joker
  jokers_debuffers = ChallengeMod.Tag:new("jokers_debuffers", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_final_heart",
    },
  }),
  --- All possible ways to face down joker
  jokers_face_down = ChallengeMod.Tag:new("jokers_face_down", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_final_acorn",
    },
  }),
  --- All jokers that can disappear (extinct)
  jokers_decay = ChallengeMod.Tag:new("jokers_decay", {
    JOKERS = {
      "j_gros_michel",
      "j_ice_cream",
      "j_cavendish",
      "j_turtle_bean",
      "j_popcorn",
      "j_ramen",
      "j_selzer",
      "j_mr_bones",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All scaling or scaler jokers
  jokers_scaling = ChallengeMod.Tag:new("jokers_scaling", {
    JOKERS = {
      "j_ceremonial",
      "j_supernova",
      "j_ride_the_bus",
      "j_runner",
      "j_constellation",
      "j_green_joker",
      "j_red_card",
      "j_square",
      "j_vampire",
      "j_hologram",
      "j_obelisk",
      "j_fortune_teller",
      "j_lucky_cat",
      "j_flash",
      "j_trousers",
      "j_castle",
      "j_campfire",
      "j_throwback",
      "j_glass",
      "j_wee",
      "j_hit_the_road",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All jokers with reset mechanic
  jokers_with_reset = ChallengeMod.Tag:new("jokers_with_reset", {
    JOKERS = {
      "j_ride_the_bus",
      "j_green_joker",
      "j_obelisk",
      "j_campfire",
      "j_hit_the_road",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to retrigger a joker
  jokers_retriggers = ChallengeMod.Tag:new("jokers_retriggers", {
    JOKERS = {
      "j_blueprint",
      "j_brainstorm",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),

  -- Consumables, vouchers and tags manipulation

  --- All possible ways to find, get or use tarot card
  tarots_generators = ChallengeMod.Tag:new("tarots_generators", {
    JOKERS = {
      "j_8_ball",
      "j_superposition",
      "j_vagabond",
      "j_hallucination",
      "j_cartomancer",
      "j_perkeo",
    },
    TAROTS = {
      "c_fool",
      "c_emperor",
    },
    SPECTRALS = {
      "c_medium",
    },
    VOUCHERS = { 
      "v_tarots_merchant",
      "v_tarot_tycoon",
    },
    SKIPS = {
      "tag_charm"
    },
    BOOSTER_PACKS = {
      "p_arcana_normal_1",
      "p_arcana_normal_2",
      "p_arcana_normal_3",
      "p_arcana_normal_4",
      "p_arcana_jumbo_1",
      "p_arcana_jumbo_2",
      "p_arcana_mega_1",
      "p_arcana_mega_2",
    },
    BLINDS = {
    },
  }),
  --- All possible ways to find, get or use spectral card
  spectrals_generators = ChallengeMod.Tag:new("spectrals_generators", {
    JOKERS = {
      "j_sixth_sense",
      "j_seance",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
      "v_omen_globe",
    },
    SKIPS = {
      "tag_ethereal",
    },
    BOOSTER_PACKS = {
      "p_spectral_normal_1",
      "p_spectral_normal_2",
      "p_spectral_jumbo_1",
      "p_spectral_mega_1",
    },
    BLINDS = {
    },
  }),
  --- All possible ways to find, get or use planet card
  planets_generators = ChallengeMod.Tag:new("planets_generators", {
    JOKERS = {
    },
    TAROTS = {
      "c_high_priestess",
    },
    SPECTRALS = {
      "c_trance",
    },
    VOUCHERS = { 
      "v_telescope",
    },
    SKIPS = {
      "tag_meteor",
    },
    BOOSTER_PACKS = {
      "p_celestial_normal_1",
      "p_celestial_normal_2",
      "p_celestial_normal_3",
      "p_celestial_normal_4",
      "p_celestial_jumbo_1",
      "p_celestial_jumbo_2",
      "p_celestial_mega_1",
      "p_celestial_mega_2",
    },
    BLINDS = {
    },
  }),
  --- All possible ways to add voucher in the shop
  vouchers_generators = ChallengeMod.Tag:new("vouchers_generators", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
      "tag_voucher",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways to get skip tag (double tag)
  tags_generators = ChallengeMod.Tag:new("tags_generators", {
    JOKERS = {
      "j_diet_cola"
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
      "tag_double",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),

  -- Shop

  --- All possible ways decrease price of joker in shop
  shop_jokers_discount = ChallengeMod.Tag:new("shop_jokers_discount", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
      "v_clearance_sale",
      "v_liquidation",
    },
    SKIPS = {
      "tag_uncommon",
      "tag_rare",
      "tag_negative",
      "tag_foil",
      "tag_holo",
      "tag_polychrome",
      "tag_coupon",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways decrease price of booster pack in shop
  shop_booster_packs_discount = ChallengeMod.Tag:new("shop_booster_packs_discount", {
    JOKERS = {
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
      "v_clearance_sale",
      "v_liquidation",
    },
    SKIPS = {
      "tag_coupon",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All possible ways decrease price of reroll in shop
  shop_rerolls_discount = ChallengeMod.Tag:new("shop_rerolls_discount", {
    JOKERS = {
      "j_chaos",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = {
      "v_reroll_surplus",
      "v_reroll_glut",
    },
    SKIPS = {
      "tag_d_six",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),

  -- Specific mechanics

  --- All possible ways to upgrade poker hand without using planet card
  hands_upgrade = ChallengeMod.Tag:new("hands_upgrade", {
    JOKERS = {
      "j_space",
      "j_burnt",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
      "tag_orbital",
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
  --- All stuff that has probability-based mechanics
  probability_based = ChallengeMod.Tag:new("probability_based", {
    JOKERS = {
      "j_oops",
      "j_8_ball",
      "j_gros_michel",
      "j_business",
      "j_space",
      "j_cavendish",
      "j_reserved_parking",
      "j_hallucination",
      "j_bloodstone",
    },
    TAROTS = {
      "c_magician",
      "c_wheel_of_fortune",
      "c_justice",
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
      "bl_wheel"
    },
  }),
  --- All stuff that has effect on sale
  effect_on_sale = ChallengeMod.Tag:new("effect_on_sale", {
    JOKERS = {
      "j_diet_cola",
      "j_invisible",
    },
    TAROTS = {
    },
    SPECTRALS = {
    },
    VOUCHERS = { 
    },
    SKIPS = {
    },
    BOOSTER_PACKS = {
    },
    BLINDS = {
    },
  }),
}

--- Formats items into a list of tables with an 'id' key.
-- @param items The list of items to format.
-- @return A list of formatted items.
function format_items(items)
  local formatted_items = {}
  for _, item in ipairs(items) do
    table.insert(formatted_items, { id = item })
  end
  return formatted_items
end
