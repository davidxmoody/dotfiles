hs.window.animationDuration = 0

function printTable(t)
  for k, v in pairs(t) do
    print(k, v)
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

function focusIphoneSimulatorOrPosticoWindow()
  local win = hs.window.find("iPhone ")
  if win == nil then
    focusPosticoWindow()
  else
    win:focus()
  end
end

-- TODO find a way to trigger these when external monitors are changed (or
-- on some other event)
-- hs.keycodes.setLayout("Programmer Dvorak")
-- hs.keycodes.setLayout("U.S.")

function openChromeThenSlack()
  local app = hs.application.applicationsForBundleID("com.google.Chrome")[1]
  if app == nil then
    hs.alert.show("Could not find Chrome window")
    return
  end

  local win = app:mainWindow()
  if win == nil then
    hs.alert.show("Could not find Chrome window")
    return
  end

  if win ~= hs.window.focusedWindow() then
    win:focus()
    return
  end

  if not string.match(win:title(), " | Candide Slack %- Google Chrome$") then
    hs.eventtap.keyStroke({"cmd"}, "1") -- Focus first tab (Slack)
    return
  end

  hs.eventtap.keyStroke({"cmd"}, "K") -- Open Slack channel chooser
end

function focusIterm()
  local app = hs.application.applicationsForBundleID("com.googlecode.iterm2")[1]
  local win = app:mainWindow()

  if win == nil then
    hs.alert.show("Could not find iTerm window")
  elseif win ~= hs.window.focusedWindow() then
    win:focus()
  else
    -- Do nothing
  end
end

function focusSimulatorAndChrome()
  local app = hs.application.applicationsForBundleID("com.apple.iphonesimulator")[1]
  if app == nil then
    hs.alert.show("No simulator application")
    return
  end

  local win = app:mainWindow()
  if win == nil then
    hs.alert.show("No simulator window")
    return
  end

  local chrome_app = hs.application.applicationsForBundleID("com.google.Chrome")[1]
  if chrome_app == nil then
    hs.alert.show("Could not find Chrome window")
    return
  end

  local chrome_win = chrome_app:mainWindow()
  if chrome_win == nil then
    hs.alert.show("Could not find Chrome window")
    return
  end

  chrome_win:focus()
  win:focus()
end

mod = {"cmd", "ctrl"}

hs.hotkey.bind(mod, "Z", openChromeThenSlack) -- Mouse

hs.hotkey.bind(mod, "T", focusIterm) -- Left bottom

hs.hotkey.bind(mod, "N", openChromeThenSlack) -- Right bottom
hs.hotkey.bind(mod, "H", focusSimulatorAndChrome) -- Right middle
hs.hotkey.bind(mod, "C", focusIphoneSimulatorOrPosticoWindow) -- Right top
hs.hotkey.bind(mod, "W", focusIphoneSimulatorOrPosticoWindow) -- Right top-right

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", hs.reload)

hs.alert.show("Config loaded")
