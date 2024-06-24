ChallengeMod = {}
function initChallenges()
  local lovely = require("lovely")
  local nativefs = require("nativefs")
  assert(load(nativefs.read(lovely.mod_dir .. "/ChallengeMod/challenge_handler.lua")))()
  assert(load(nativefs.read(lovely.mod_dir .. "/ChallengeMod/mechanics.lua")))()
end

ChallengeMod.RELEASE = false
ChallengeMod.VERSION = "1.0.0"