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

-- function focusSlackWindow()
--   local win = hs.window.find("Slack - ")
--   if win == nil then
--     hs.alert.show("Could not find Slack window")
--   else
--     win:focus()
--   end
-- end

function focusSlackWindow()
  focusChromeWindow()
  hs.eventtap.keyStroke({"cmd"}, "1")
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

hs.hotkey.bind({"cmd", "ctrl"}, "B", focusPosticoWindow)
hs.hotkey.bind({"cmd", "ctrl"}, "M", focusIphoneSimulatorWindow)

hs.hotkey.bind({"cmd", "ctrl"}, "F", moveToOtherScreen)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", hs.reload)

-- Trying a different modifier key (to avoid having too many different modifiers).
-- These currently only work using my ErgoDox layout, would be good to get them
-- working on the standard Macbook Pro keyboard in Programmer Dvorak layout.
-- Would also be good to get auto keyboard switching working.

hs.hotkey.bind({"cmd", "shift"}, 28, openSlackChannel) -- "*"
hs.hotkey.bind({"cmd", "shift"}, 29, focusSlackWindow) -- ")"
hs.hotkey.bind({"cmd", "shift"}, 24, focusTmuxWindow) -- "+"
hs.hotkey.bind({"cmd"}, 30, focusChromeWindow) -- "]"

-- TODO find a way to trigger these when external monitors are changed (or
-- on some other event)
-- hs.keycodes.setLayout("Programmer Dvorak")
-- hs.keycodes.setLayout("U.S.")

hs.alert.show("Config loaded")
