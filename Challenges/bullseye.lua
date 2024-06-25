local Challenge = {}
Challenge.NAME = "Bullseye"
Challenge.DESIGNER = "qcom_"
Challenge.DATE_CREATED = 240610 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {
        id = "cm_no_overscoring",
        value = "115",
      },
    },
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge