dailyModifiers = {
  { name = "High Stakes", desc = "All Blinds require {c:chips}25%{} more chips to defeat" },
  { name = "Short Stack", desc = "Start with only 1 discard, but you receive {c:money}$3{} for each remaining hand." },
  { name = "Poker Pro", desc = "Start with a {c:booster}Mega Buffoon Pack{}" },
  { name = "Big Boss", desc = "Boss Blinds are {c:attention}2x{} as big" },
  { name = "Early Bird", desc = "{c:attention}+1{} Hand Size for the first 3 Antes, then {c:attention}-2 Hand Size" },
  {
    name = "Card Shark",
    desc = "By default, no consumables appear in shops. {c:voucher}Tarot Merchant{} and {c:voucher} Planet Merchant{} restores their respective consumables ability to show up",
  },
  {
    name = "Saving Spree",
    desc = "At the end of an Ante, Earn an extra {c:money}$2{} per hand for each hand not played in the previous Ante",
  },
  { name = "Blinding Speed", desc = "Small and Big Blinds must be completed within a limited number of hands" },
  {
    name = "All in",
    desc = "Start with {c:attention}3{} extra Joker slots, but lose {c:money}$2{} for each hand played",
  },
  { name = "", desc = "All money earned from defeating blinds is {c:attention}doubled{}, {c:attention}-1 hand size" },
  { name = "Tag Frenzy", desc = "Skipping Small and Big Blinds grants {c:attention}2{} tags instead of 1" },
  { name = "Second Wind", desc = "Start with {c:attention}Mr Bones{}, and earn {c:money}$20{} if he saves you" },
  {
    name = "Cash Flow",
    desc = "Every {c:money}$10{} you have {c:attention} decreases your maximum discards by {c:attention}1{}, but you start with {c:attention}5{} discards",
  },
  { name = "Buy One Get ONe Free", desc = "Start with {c:voucher}Overstock{} and {c:voucher}Clearance Sale{}" },
  { name = "All Up Front", desc = "Start with {c:money}$100{}, but you earn no income from defeating blinds" },
  { name = "Cork Board", desc = "All Jokers are {c:attention}Pinned{}" },
  { name = "Positivity", desc = "Gain a {c:eternal}Negative Tag{} after defeating each Boss Blind" },
  {
    name = "Jack Of All Trades",
    desc = "Start with {c:secondary_set.planet}1{} level on each hand, but Planet cards are removed from the shop",
  },
  { name = "Dieting", desc = "Start with {c:attention}1{} less suit" },
  { name = "Headstart", desc = "Start with {c:voucher}Heiroglyph{}" },
  {
    name = "Risky Draw",
    desc = "{c:attention}-3{} hand size at the start of each round. Gain {c:attention}+1{} for each hand played. Resets after the round",
  },
  { name = "Moving Day", desc = "{c:booster}Booster Packs{} can now show up in regular shop slots" },
}


function ChallengeMod.evaluate_daily_modifiers(self, v)
    -- if v.id == "dm_<ID>" then
    --     self.GAME.modifiers.dm_<ID> = true
    -- elseif ...
end