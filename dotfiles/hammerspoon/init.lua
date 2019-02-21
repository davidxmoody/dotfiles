hs.window.animationDuration = 0

function focusTmuxWindow()
  local win = hs.window.find("tmux")
  if win == nil then
    hs.alert.show("Could not find tmux window")
  else
    win:focus()
  end
end

function focusIphoneSimulatorWindow()
  local win = hs.window.find("iPhone ")
  if win == nil then
    hs.alert.show("Could not find simulator window")
  else
    win:focus()
  end
end

function focusChromeWindow()
  local win = hs.window.find("Google Chrome")
  if win == nil then
    hs.alert.show("Could not find Chrome window")
  else
    win:focus()
  end
end

function focusSlackWindow()
  local win = hs.window.find("Slack - ")
  if win == nil then
    hs.alert.show("Could not find Slack window")
  else
    win:focus()
  end
end

function focusPosticoWindow()
  hs.application.launchOrFocus("postico.app")
end

function newChromeTab()
  focusChromeWindow()
  hs.eventtap.keyStroke({"cmd"}, "T")
end

function openSlackChannel()
  focusSlackWindow()
  hs.eventtap.keyStroke({"cmd"}, "K")
end

function moveToOtherScreen()
  local win = hs.window.focusedWindow()
  local currentScreenName = win:screen():name()
  local nextScreenName = nil

  for k, v in pairs(hs.screen.allScreens()) do
    if v:name() ~= currentScreenName then
      nextScreenName = v:name()
      break
    end
  end

  if nextScreenName ~= nil then
    win:moveToScreen(nextScreenName)
    win:focus()
  end
end

hs.hotkey.bind({"cmd", "ctrl"}, "S", focusSlackWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "L", openSlackChannel)

hs.hotkey.bind({"cmd", "ctrl"}, "H", focusTmuxWindow)

hs.hotkey.bind({"cmd", "ctrl"}, "C", focusChromeWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "T", newChromeTab)

hs.hotkey.bind({"cmd", "ctrl"}, "B", focusPosticoWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "M", focusIphoneSimulatorWindow)

hs.hotkey.bind({"cmd", "ctrl"}, "F", moveToOtherScreen)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", hs.reload)

hs.alert.show("Config loaded")
