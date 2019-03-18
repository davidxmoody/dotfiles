-- Helpers and config ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

hs.window.animationDuration = 0

function printTable(t)
  for k, v in pairs(t) do
    print(k, v)
  end
end

function getMainWindow(bundleID)
  local app = hs.application.applicationsForBundleID(bundleID)[1]
  if app == nil then
    hs.alert.show("No application found for bundleID: " + bundleID)
    return nil
  end

  local win = app:mainWindow()
  if win == nil then
    hs.alert.show("No main window found for bundleID: " + bundleID)
    return nil
  end

  return win
end

-- Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function focusPosticoWindow()
  hs.application.launchOrFocus("postico.app")
end

-- function moveToOtherScreen()
--   local win = hs.window.focusedWindow()
--   local currentScreenName = win:screen():name()
--   local nextScreenName = nil

--   for k, v in pairs(hs.screen.allScreens()) do
--     if v:name() ~= currentScreenName then
--       nextScreenName = v:name()
--       break
--     end
--   end

--   if nextScreenName ~= nil then
--     win:moveToScreen(nextScreenName)
--     win:focus()
--   end
-- end

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
  local win = getMainWindow("com.google.Chrome")

  if win ~= hs.window.focusedWindow() then
    win:focus()
  elseif not string.match(win:title(), " | Candide Slack %- Google Chrome$") then
    hs.eventtap.keyStroke({"cmd"}, "1") -- Focus first tab (Slack)
  else
    hs.eventtap.keyStroke({"cmd"}, "K") -- Open Slack channel chooser
  end
end

function focusIterm()
  local win = getMainWindow("com.googlecode.iterm2")
  win:focus()
end

function focusSimulatorAndChrome()
  local chromeWin = getMainWindow("com.google.Chrome")
  local simulatorWin = getMainWindow("com.apple.iphonesimulator")
  chromeWin:focus()
  simulatorWin:focus()
end

function focusNextNonChromeOrItermWindow()
  for k, win in pairs(hs.window.orderedWindows()) do
    if win:application():bundleID() ~= "com.google.Chrome" and win:application():bundleID() ~= "com.googlecode.iterm2" then
      win:focus()
      return
    end
  end
end

-- Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mod = {"cmd", "ctrl"}

hs.hotkey.bind(mod, "Z", openChromeThenSlack) -- Mouse

hs.hotkey.bind(mod, "T", focusIterm) -- Left bottom

hs.hotkey.bind(mod, "N", openChromeThenSlack) -- Right bottom
hs.hotkey.bind(mod, "H", focusSimulatorAndChrome) -- Right middle
hs.hotkey.bind(mod, "C", focusNextNonChromeOrItermWindow) -- Right top
hs.hotkey.bind(mod, "W", focusIphoneSimulatorOrPosticoWindow) -- Right top-right

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", hs.reload)

hs.alert.show("Config loaded")
