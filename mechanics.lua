local lovely = require("lovely")
local nativefs = require("nativefs")


function ChallengeMod.localizeMechDescriptions()
  --  Custom Mechanic Descriptions
  G.localization.misc.v_text.ch_c_all_perishable = { "All Jokers are {C:attention}Perishable{}" }
  G.localization.misc.v_text.ch_c_cm_record = { "Current Record: {C:attention}#1#{} by {C:attention}#2#{}" }
  G.localization.misc.v_text.ch_c_cm_pinned_jokers = { "All Jokers are {C:attention}Pinned{}}" }
  G.localization.misc.v_text.ch_c_decreasing_handsize = { "Hand size {C:attention}Decreases{} each Ante" }
  G.localization.misc.v_text.ch_c_all_rental = { "All Jokers are {C:attention}Rental{}" }
  G.localization.misc.v_text.ch_c_cm_force_hand = { "Played hands must contain a {C:blue}#1#{}" }
  G.localization.misc.v_text.ch_c_cm_negative_interest = { "Money is lost from {C:attention}Interest{}" }
  G.localization.misc.v_text.ch_c_cm_no_overscoring = { "{C:attention}Blind{} score must not exceed {C:green}#1#%{}" }
  G.localization.misc.v_text.ch_c_no_shop_planets = { "Planets no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_no_shop_tarots = { "Tarots no longer appear in the {C:attention}shop{}" }
  G.localization.misc.v_text.ch_c_cm_scaling = { "Custom ante scaling" }
  G.localization.misc.v_text.ch_c_set_seed = {"Set Seed: {C:attention}???{}"}
  -- G.localization.misc.v_text.ch_c_cm_scaling_manual = { "Custom ante and blind scaling" }
  G.localization.misc.v_text.ch_c_cm_noshop = { "{C:attention}No Shop" }
  G.localization.misc.v_text.ch_c_cm_hand_kills = { "Lose the game if played hand contains a {C:blue}#1#{}" }
  G.localization.misc.v_text.ch_c_cm_all_facedown = { "All cards except those held in hand are face down" }
  G.localization.misc.v_text.ch_c_cm_repeat_bosses = { "Bosses may repeat in this challenge" }
  G.localization.misc.v_text.ch_c_cm_soul_luck = { "Your soul feels weird..." }
  G.localization.misc.v_text.ch_c_cm_no_after_hand = { "{C:attention}After hand{} Joker abilities are disabled" }
  G.localization.misc.v_text.ch_c_cm_no_after_round = { "{C:attention}After round{} Joker abilities are disabled" }
  G.localization.misc.v_text.ch_c_cm_no_on_discard = { "{C:attention}On discard{} Joker abilities are disabled" }
  G.localization.misc.v_text.ch_c_cm_rand_card_destroy = { "You lose {C:attention}#1#{} cards at the end of every round and on round skip." }
  G.localization.misc.v_text.ch_c_cm_draw_deck = { "Your handsize is set to your deck size at the start of every round" }
  G.localization.misc.v_text.ch_c_cm_all_blind_increase = { "Blinds are all {C:attention}#1#{} times larger" }
  G.localization.misc.v_text.ch_c_cm_hands_cost = { "Playing a hand costs you {C:attention}#1#{} dollars." }
  G.localization.misc.v_text.ch_c_cm_debuff_cards = { "All playing cards are {C:attention}debuffed{}" }
  G.localization.misc.v_text.ch_c_cm_expelled_1 = {'Bans all {C:attention}Jokers, {C:tarot}Tarots, {C:spectral}Spectrals,'}
  G.localization.misc.v_text.ch_c_cm_expelled_2 = {'{C:planet}Planets{} and {C:attention}Tags{} placed in the'}
  G.localization.misc.v_text.ch_c_cm_expelled_3 = {'top two tiers of BU\'s tier lists'}
  G.localization.misc.v_text.ch_c_cm_omit_digits = {'Omits all numerical {C:attention}digits'}
  G.localization.misc.v_text.ch_c_cm_lose_money_on_select = {'Lose {C:money}$1{} whenever a card is selected'}
  -- Daily Modifiers
  G.localization.misc.v_text.ch_c_dm_dollars_per_hand = {"Start with only 1 discard, but you receive {c:money}#1#{} for each remaining hand"}
  G.localization.misc.v_text.ch_c_dm_ante_handsize_change = { "Handsize is {C:attention}+3{} for the first {C:blue}#1#{} antes, then {C:attention}-1{}" }
  G.localization.misc.v_text.ch_c_dm_boss_increase = { "Boss Blinds are {C:attention}#1#{} times larger" }
  G.localization.misc.v_text.ch_c_dm_restock_consumeables = { "Buying {C:attention}Tarot Merchant{} or {C:attention}Planet Merchant{} restocks the shop with those cards available." }
  G.localization.misc.v_text.ch_c_dm_last_ante_hand = { "On ante end, you earn {C:money}$#1#{} for every hand not played in the previous ante." }
end

function ChallengeMod.evaluate_rules(self, v)
  if v.id == 'cm_noshop' then
    self.GAME.modifiers.cm_noshop = true
  elseif v.id == 'cm_auto_pack' then
    self.GAME.modifiers.cm_auto_pack = true
  elseif v.id == 'cm_decreasing_handsize' then
    self.GAME.modifiers.cm_decreasing_handsize = v.value
  elseif v.id == 'cm_scaling' then
    self.GAME.modifiers.cm_scaling = v.value
  elseif v.id == 'all_perishable' then
    self.GAME.modifiers.all_perishable = true
  elseif v.id == 'all_rental' then
    self.GAME.modifiers.all_rental = true
  elseif v.id == 'no_shop_planets' then
    self.GAME.planet_rate = 0
  elseif v.id == 'no_shop_tarots' then
    self.GAME.tarot_rate = 0
  elseif v.id == 'cm_all_facedown' then
    self.GAME.modifiers.cm_all_facedown = true
  elseif v.id == 'cm_soul_luck' then
    self.GAME.modifiers.cm_soul_luck = v.value
  elseif v.id == 'cm_repeat_bosses' then
    self.GAME.modifiers.cm_repeat_bosses = true
  elseif v.id == 'cm_pinned_jokers' then
    self.GAME.modifiers.cm_pinned_jokers = true
  elseif v.id == 'cm_rand_card_destroy' then
    self.GAME.modifiers.cm_rand_card_destroy = v.value
  elseif v.id == 'cm_draw_deck' then
    self.GAME.modifiers.cm_draw_deck = true
  elseif v.id == 'cm_all_blind_increase' then
    self.GAME.modifiers.cm_all_blind_increase = v.value
  elseif v.id == "cm_hands_cost" then
    self.GAME.modifiers.cm_hands_cost = v.value
  elseif v.id == "cm_random_deck" then
    self.GAME.modifiers.cm_random_deck = true
    local decks = {
      "Red Deck",
      "Blue Deck",
      "Yellow Deck",
      "Green Deck",
      "Black Deck",
      "Magic Deck",
      "Nebula Deck",
      "Ghost Deck",
      "Abandoned Deck",
      "Checkered Deck",
      "Zodiac Deck",
      "Painted Deck",
      "Anaglyph Deck",
      "Plasma Deck",
      "Erratic Deck",
      "Challenge Deck",
    }
    local rand = math.random(#decks)
    local selected_back = decks[rand]
    selected_back = get_deck_from_name(selected_back)
    self.GAME.selected_back = Back(selected_back)
    self.GAME.selected_back_key = selected_back
    self.GAME.selected_back:apply_to_run()
  end
end


function ChallengeMod.destroy_random_cards(amount)
  if amount <= #G.playing_cards then
    for i=1, amount, 1 do
      local index = math.random(1, #G.playing_cards+1)
      local card = G.playing_cards[index]
      card:remove()
    end
  else
    for i=1, #G.playing_cards, 1 do
      local index = math.random(1, #G.playing_cards)
      local card = G.playing_cards[index]
      card:remove()
    end
  end
end

local get_blind_amount_ref = get_blind_amount
function get_blind_amount(ante)
  local k = 0.75
  if G.GAME.modifiers.cm_scaling then
    local amounts = G.GAME.modifiers.cm_scaling
    if ante < 1 then
      return 100
    end
    if ante <= 8 then
      if G.GAME.modifiers.cm_all_blind_increase then
        return amounts[ante]*tonumber(G.GAME.modifiers.cm_all_blind_increase)
      end
      return amounts[ante]
    end
    local a, b, c, d = amounts[8], 1.6, ante - 8, 1 + 0.2 * (ante - 8)
    local amount = math.floor(a * (b + (k * c) ^ d) ^ c)
    amount = amount - amount % (10 ^ math.floor(math.log10(amount) - 1))
    if G.GAME.modifiers.cm_all_blind_increase then
      amount = amount*tonumber(G.GAME.modifiers.cm_all_blind_increase)
    end
    return amount
  end

  if G.GAME.modifiers.cm_all_blind_increase then
    return get_blind_amount_ref(ante)*tonumber(G.GAME.modifiers.cm_all_blind_increase)
  end

  return get_blind_amount_ref(ante)
end

function taxedAlert(text)
  G.E_MANAGER:add_event(Event({
    trigger = "after",
    delay = 0.4,
    func = function()
      attention_text({
        text = text,
        scale = 0.8,
        hold = 4,
        major = G.STAGE == G.STAGES.RUN and G.play or G.title_top,
        backdrop_colour = G.C.MONEY,
        align = "cm",
        offset = {
          x = 0,
          y = -3.5,
        },
        silent = true,
      })
      G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.06 * G.SETTINGS.GAMESPEED,
        blockable = false,
        blocking = false,
        func = function()
          play_sound("coin3", 0.76, 0.4)
          play_sound("coin4", 0.76, 0.4)
          return true
        end,
      }))
      return true
    end,
  }))
end

function Card:set_perishable(_perishable)
  self.ability.perishable = nil
  if (self.config.center.perishable_compat or G.GAME.modifiers.all_perishable) and not self.ability.eternal then
    self.ability.perishable = true
    self.ability.perish_tally = G.GAME.perishable_rounds
  end
end

function ChallengeMod.fold()
  G.STATE = G.STATES.GAME_OVER
  if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
  end
  G:save_settings()
  G.FILE_HANDLER.force = true
  G.STATE_COMPLETE = false
  G.SETTINGS.paused = false
end

local blind_debuff_card_ref = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
  if G.GAME.modifiers.cm_debuff_cards and card and card.area ~= G.jokers then
    card:set_debuff(true)
    return
  end
  return blind_debuff_card_ref(self, card, from_blind)
end

local blind_debuff_hand_ref = Blind.debuff_hand
function Blind:debuff_hand(cards, hand, handname, check)
  if G.GAME.modifiers.cm_force_hand then
    if check then
      cards = G.hand.highlighted
    end
    local poker_hands = evaluate_poker_hand(cards)
    if next(poker_hands[G.GAME.modifiers.cm_force_hand]) == nil then
      return true
    end
  end

  if not check then
    if G.GAME.modifiers.cm_hand_kills then
      local poker_hands = evaluate_poker_hand(cards)
      if next(poker_hands[G.GAME.modifiers.cm_hand_kills]) ~= nil then
        ChallengeMod.fold()
      end
    end
  end

  return blind_debuff_hand_ref(self, cards, hand, handname, check)
end

local blind_defeat_ref = Blind.defeat
function Blind:defeat(silent)
  if G.GAME.modifiers.cm_negative_interest then
    local tax = math.min(math.floor(G.GAME.dollars / 5), G.GAME.interest_cap / 5)
    taxedAlert("-$" .. tax)
    ease_dollars(-math.abs(tax))
  end
  if G.GAME.modifiers.cm_auto_pack then
    local key = "p_arcana_mega_" .. (math.random(1, 2))
    local card = Card(
      G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
      G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
      G.CARD_W * 1.27,
      G.CARD_H * 1.27,
      G.P_CARDS.empty,
      G.P_CENTERS[key],
      { bypass_discovery_center = true, bypass_discovery_ui = true }
    )
    card.cost = 0
    card.from_tag = false
    G.FUNCS.use_card({ config = { ref_table = card } })
    card:start_materialize()
    G.GAME.cm_auto_pack_opened = true
    delay(0.6)
  end
  blind_defeat_ref(self, silent)

  if
    G.GAME.modifiers.cm_no_overscoring and (G.GAME.chips > self.chips * (G.GAME.modifiers.cm_no_overscoring / 100))
  then
    ChallengeMod.fold()
  end
end
