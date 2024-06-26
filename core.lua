ChallengeMod = {}
function initChallenges()
  local lovely = require("lovely")
  local nativefs = require("nativefs")
  ChallengeMod.PATH = lovely.mod_dir .. "/BU-CB/"
  assert(load(nativefs.read(ChallengeMod.PATH.."challenge_handler.lua")))()
  assert(load(nativefs.read(ChallengeMod.PATH.."mechanics.lua")))()
end

ChallengeMod.RELEASE = false
ChallengeMod.VERSION = "BU-CB-".."1.0.0".."-"..(ChallengeMod.RELEASE and "FULL" or "DEV")

function ChallengeMod.draw()
  if not ChallengeMod.RELEASE then
    love.graphics.push()
    love.graphics.setColor(G.C.WHITE)
    love.graphics.print(ChallengeMod.VERSION, 10, 30)
    love.graphics.pop()
  end
end