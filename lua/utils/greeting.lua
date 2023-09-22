local M = {}

M.generate = function(name)
  if name == nil then
    name = os.getenv "USER"
  end
  local tableTime = os.date "*t"
  local datetime = os.date " %Y-%m-%d  %H:%M:%S"
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = "   Nice 󰒲 Dreamin!",
    [2] = "󰖨  Good   Morning!",
    [3] = "󰖨 Good 󰶟 Afternoon!",
    [4] = "󰖨   Good 󱀄 Evening!",
    [5] = "󰖔 It's 󱌌 Showtimes!",
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return datetime .. " " .. greetingsTable[greetingIndex] .. name
end

return M
