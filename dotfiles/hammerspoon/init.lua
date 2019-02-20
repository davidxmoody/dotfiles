function getTmuxWindow() return hs.window.find("tmux") end
function getChromeWindow() return hs.window.find("Google Chrome") end

function focusTmuxWindow() getTmuxWindow():focus() end
function focusChromeWindow() getChromeWindow():focus() end
function newChromeTab()
  focusChromeWindow()
  hs.eventtap.keyStroke({"cmd"}, "T")
end

hs.hotkey.bind({"cmd", "ctrl"}, "H", newChromeTab)
hs.hotkey.bind({"cmd", "ctrl"}, "T", focusTmuxWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "N", focusChromeWindow)
