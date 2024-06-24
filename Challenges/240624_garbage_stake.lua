return {
  name = "Garbage Stake",
  id = "c_mod_garbage_1",
  rules = {
    custom = {
      { id = "all_perishable" },
      { id = "all_rental" },
      { id = "cm_all_facedown" },
      { id = "cm_hand_kills", value = "Straight" },
      { id = "no_interest" },
      { id = "cm_soul_luck", value = "0.8" },
      {
        id = "cm_credit",
        value = "Cheerio1101",
      },
    },
    modifiers = {
      { id = "reroll_cost", value = 10 },
      { id = "hands", value = 2 },
      { id = "discards", value = 2 },
    },
  },
  jokers = {},
  consumeables = {},
  vouchers = {},
  deck = {
    type = "Challenge Deck",
  },
  restrictions = {
    banned_cards = {
      { id = "j_cartomancer" },
      { id = "j_sixth_sense" },
      { id = "j_seance" },
      { id = "j_hallucination" },
      { id = "j_superposition" },
      { id = "j_vagabond" },
      --banned all legendaries. gonna increase the probability of soul card to only 1/10. totally gonna troll the doc into thinking he has a legendary. its all face down jokers so he wont know
      { id = "j_perkeo" },
      { id = "j_triboulet" },
      { id = "j_caino" },
      { id = "j_chicot" },
      { id = "j_yorick" },
    },
    banned_tags = {},
    banned_other = {},
  },
}
