local Challenge = {}
Challenge.NAME = "Certified Gambler"
Challenge.DESIGNER = "CampfireCollective"
Challenge.DATE_CREATED = 240616 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
    },
  },
  jokers = {
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
    { id = "j_certificate", eternal = true, edition = "negative" },
  },
  deck = {
    cards = {
      { s = "S", r = "Q" },
      { s = "H", r = "J" },
      { s = "C", r = "T" },
      { s = "D", r = "9" },
      { s = "S", r = "8" },
    },
    type = "Challenge Deck",
  },
}

return Challenge