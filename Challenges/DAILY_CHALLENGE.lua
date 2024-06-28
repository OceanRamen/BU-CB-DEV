local http = require("https")
local url = "https://gist.github.com/OceanRamen/bb6c4f23509bacf050d6338090dc012c/raw"
local code, body = http.request(url)
if not body then
  error(code)
end


local Challenge = {}
Challenge.NAME = "Daily Challenge"
Challenge.DESIGNER = "Djynasty"
Challenge.DATE_CREATED = 240627 -- Y/M/D
Challenge.VERSION = "1.0.0"
Challenge.DATA = {
  rules = {
    custom = {
      {id = "daily"},
      {id = "set_seed", value = body},
    },
    modifiers = {},
  },
  deck = {
    type = "Challenge Deck",
  },
}

return Challenge
