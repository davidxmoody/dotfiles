function getTmuxWindow() return hs.window.find("tmux") end
function getChromeWindow() return hs.window.find("Google Chrome") end

hs.hotkey.bind({"alt", "ctrl"}, "T", function()
  getTmuxWindow():focus()
end)

hs.hotkey.bind({"alt", "ctrl"}, "C", function()
  getChromeWindow():focus()
end)

hs.hotkey.bind({"alt", "ctrl"}, "S", function()
  getChromeWindow():focus()
  hs.eventtap.keyStroke({"cmd"}, "3")
end)
