ChallengeMod = {}
ChallengeMod.DAILY = {}
ChallengeMod.DAILY.DATE = {}

--- Initializes challenges by loading necessary modules.
function initChallenges()
  local lovely = require("lovely")
  local nativefs = require("nativefs")
  ChallengeMod.PATH = lovely.mod_dir .. "/BU-CB/"
  assert(load(nativefs.read(ChallengeMod.PATH .. "challenge_handler.lua")))()
  assert(load(nativefs.read(ChallengeMod.PATH .. "mechanics.lua")))()
  assert(load(nativefs.read(ChallengeMod.PATH .. "Daily/daily_handler.lua")))()
  assert(load(nativefs.read(ChallengeMod.PATH .. "Daily/daily_mechanics.lua")))()
end

ChallengeMod.RELEASE = false
ChallengeMod.VERSION = "BU-CB-" .. "1.0.0" .. "-" .. (ChallengeMod.RELEASE and "FULL" or "DEV")

--- Draws the challenge mod version on the screen.
function ChallengeMod.draw()
  if not ChallengeMod.RELEASE then
    love.graphics.push()
    love.graphics.setColor(G.C.WHITE)
    love.graphics.print(ChallengeMod.VERSION, 10, 30)
    love.graphics.pop()
  end
end

ChallengeMod.DAILY.DATE.elapsedTime = 0

--- Gets the current date in the format YYYYMMDD.
-- @return The current date as a string.
function ChallengeMod.DAILY.DATE.get_current_date()
  local date = os.date("!*t")
  return string.format("%04d%02d%02d", date.year, date.month, date.day)
end

ChallengeMod.DAILY.DATE.current_date = ChallengeMod.DAILY.DATE.get_current_date()

--- Updates the challenge mod, including updating the date and writing scores.
-- @param dt The delta time since the last update.
function ChallengeMod.update(dt)
  local tperiod = 15
  ChallengeMod.DAILY.DATE.elapsedTime = ChallengeMod.DAILY.DATE.elapsedTime + dt
  if ChallengeMod.DAILY.DATE.elapsedTime >= tperiod then
    local current_date = ChallengeMod.DAILY.DATE.get_current_date()
    ChallengeMod.DAILY.DATE.current_date = current_date
    ChallengeMod.DAILY.DATE.elapsedTime = ChallengeMod.DAILY.DATE.elapsedTime - tperiod
    ChallengeMod.DAILY.write_score(400, current_date)
    ChallengeMod.DAILY.update_challenge_text()
  end
end

ChallengeMod.Helper = {}

---
-- Wraps the input text into multiple lines, ensuring that each line does not exceed the specified maximum width.
--
-- @param text The string to be wrapped.
-- @param font The font object used to measure the width of words.
-- @param maxWidth The maximum width (in pixels) allowed for each line.
-- @return A string where the input text is broken into multiple lines, separated by newline characters.
--
-- Example usage:
-- @code
-- local wrappedText = wrapText("This is an example string that will be broken up into multiple lines based on the maximum width specified.", font, 200)
-- @endcode
--
function ChallengeMod.Helper.wrapText(text, font, maxWidth)
  local spaceWidth = font:getWidth(" ")
  local lines = {}
  local line = {}
  local lineWidth = 0

  for word in text:gmatch("%S+") do
    local wordWidth = font:getWidth(word)

    if lineWidth + wordWidth + spaceWidth <= maxWidth then
      table.insert(line, word)
      lineWidth = lineWidth + wordWidth + spaceWidth
    else
      table.insert(lines, table.concat(line, " "))
      line = { word }
      lineWidth = wordWidth + spaceWidth
    end
  end

  if #line > 0 then
    table.insert(lines, table.concat(line, " "))
  end

  return table.concat(lines, "\n")
end

--- Inspects a table up to a certain depth to avoid deep nesting.
-- @param table The table to inspect.
-- @param indent The current indentation level.
-- @param depth The current depth level.
-- @return A string representation of the table.
function ChallengeMod.Helper.inspectDepth(table, indent, depth)
  if depth and depth > 5 then
    return "Depth limit reached"
  end

  if type(table) ~= "table" then
    return "Not a table"
  end

  local str = ""
  indent = indent or 0

  for k, v in pairs(table) do
    local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
    if type(v) == "table" then
      str = str .. formatting .. "\n"
      str = str .. ChallengeMod.Helper.inspectDepth(v, indent + 1, (depth or 0) + 1)
    elseif type(v) == "function" then
      str = str .. formatting .. "function\n"
    elseif type(v) == "boolean" then
      str = str .. formatting .. tostring(v) .. "\n"
    else
      str = str .. formatting .. tostring(v) .. "\n"
    end
  end

  return str
end

--- Inspects a table and returns its string representation.
-- @param table The table to inspect.
-- @return A string representation of the table.
function ChallengeMod.Helper.inspect(table)
  if type(table) ~= "table" then
    return "Not a table"
  end

  local str = ""
  for k, v in pairs(table) do
    local valueStr = type(v) == "table" and "table" or tostring(v)
    str = str .. tostring(k) .. ": " .. valueStr .. "\n"
  end

  return str
end

--- Generates the challenge list page UI.
-- @param _page The page number to display.
-- @return The UI structure for the challenge list page.
function G.UIDEF.challenge_list_page(_page)
  local snapped = false
  local challenge_list = {}
  for k, v in ipairs(G.CHALLENGES) do
    if k > G.CHALLENGE_PAGE_SIZE * (_page or 0) and k <= G.CHALLENGE_PAGE_SIZE * ((_page or 0) + 1) then
      if G.CONTROLLER.focused.target and G.CONTROLLER.focused.target.config.id == "challenge_page" then
        snapped = true
      end
      local challenge_completed = G.PROFILES[G.SETTINGS.profile].challenge_progress.completed[v.id or ""]
      local challenge_unlocked = G.PROFILES[G.SETTINGS.profile].challenges_unlocked
        and (G.PROFILES[G.SETTINGS.profile].challenges_unlocked >= k)
      local challenge_custom = false
      local challenge_daily = false

      if string.find(v.id, "Daily_Challenge") then
        challenge_daily = true
      end

      if string.sub(v.id, 1, 2) == "cm" then
        challenge_custom = true
      end

      challenge_list[#challenge_list + 1] = {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cl", minw = 0.8 },
            nodes = {
              { n = G.UIT.T, config = { text = k .. "", scale = 0.4, colour = G.C.WHITE } },
            },
          },
          UIBox_button({
            id = k,
            col = true,
            label = { challenge_unlocked and localize(v.id, "challenge_names") or localize("k_locked") },
            button = challenge_unlocked and "change_challenge_description" or "nil",
            colour = challenge_daily and G.C.GREEN
              or challenge_custom and G.C.BLUE
              or challenge_unlocked and G.C.RED
              or G.C.GREY,
            minw = 4,
            scale = 0.4,
            minh = 0.6,
            focus_args = { snap_to = not snapped },
          }),
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.05, minw = 0.6 },
            nodes = {
              {
                n = G.UIT.C,
                config = {
                  minh = 0.4,
                  minw = 0.4,
                  emboss = 0.05,
                  r = 0.1,
                  colour = challenge_completed and G.C.GREEN or G.C.BLACK,
                },
                nodes = {
                  challenge_completed
                      and {
                        n = G.UIT.O,
                        config = {
                          object = Sprite(0, 0, 0.4, 0.4, G.ASSET_ATLAS["icons"], { x = 1, y = 0 }),
                        },
                      }
                    or nil,
                },
              },
            },
          },
        },
      }
      snapped = true
    end
  end

  return { n = G.UIT.ROOT, config = { align = "cm", padding = 0.1, colour = G.C.CLEAR }, nodes = challenge_list }
end
