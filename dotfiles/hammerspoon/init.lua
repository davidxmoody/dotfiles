function getTmuxWindow() return hs.window.find("tmux") end
function getChromeWindow() return hs.window.find("Google Chrome") end
function getSlackWindow() return hs.window.find("Slack") end

function focusTmuxWindow() getTmuxWindow():focus() end
function focusChromeWindow() getChromeWindow():focus() end
function focusSlackWindow() getSlackWindow():focus() end

function newChromeTab()
  focusChromeWindow()
  hs.eventtap.keyStroke({"cmd"}, "T")
end

function openSlackChannel()
  focusSlackWindow()
  hs.eventtap.keyStroke({"cmd"}, "K")
end

hs.hotkey.bind({"cmd", "ctrl"}, "S", focusSlackWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "L", openSlackChannel)

hs.hotkey.bind({"cmd", "ctrl"}, "H", focusTmuxWindow)

hs.hotkey.bind({"cmd", "ctrl"}, "C", focusChromeWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "T", newChromeTab)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", hs.reload)
