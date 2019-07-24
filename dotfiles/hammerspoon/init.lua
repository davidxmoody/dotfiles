-- TODO find a way to trigger these when external monitors are changed (or
-- on some other event)
-- hs.keycodes.setLayout("Programmer Dvorak")
-- hs.keycodes.setLayout("U.S.")

-- Helpers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function printTable(t)
  for k, v in pairs(t) do
    print(k, v)
  end
end

function getMainWindow(bundleID, quiet)
  local app = hs.application.applicationsForBundleID(bundleID)[1]
  if app == nil then
    if not quiet then
      hs.alert.show("No application found for bundleID: " .. bundleID)
    end
    return nil
  end

  local win = app:mainWindow()
  if win == nil then
    if not quiet then
      hs.alert.show("No main window found for bundleID: " .. bundleID)
    end
    return nil
  end

  return win
end

-- Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function openChromeThenSlack()
  local win = getMainWindow("com.google.Chrome")

  if win ~= hs.window.focusedWindow() then
    win:focus()
  elseif not string.match(win:title(), " | Candide %- Google Chrome$") then
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
  local chromeWin = getMainWindow("com.google.Chrome", true)
  local simulatorWin = getMainWindow("com.apple.iphonesimulator", true)
  if chromeWin ~= nil then chromeWin:focus() end
  if simulatorWin ~= nil then simulatorWin:focus() end
end

function focusNextNonChromeOrItermWindow()
  for k, win in pairs(hs.window.orderedWindows()) do
    bundleID = win:application():bundleID()

    if
      k ~= 1 and
      bundleID ~= "com.google.Chrome" and
      bundleID ~= "com.googlecode.iterm2" and
      bundleID ~= "org.hammerspoon.Hammerspoon" and
      bundleID ~= "org.openstenoproject.plover"
    then
      win:focus()
      return
    end
  end
end

-- Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mod = {"cmd", "ctrl"}
shiftedMod = {"cmd", "ctrl", "shift"}

hs.hotkey.bind(mod, "X", focusSimulatorAndChrome) -- Mouse

-- hs.hotkey.bind(mod, "T", focusIterm) -- Left bottom

hs.hotkey.bind(mod, "N", openChromeThenSlack) -- Right bottom
hs.hotkey.bind(mod, "H", focusNextNonChromeOrItermWindow) -- Right middle
hs.hotkey.bind(mod, "W", focusIterm) -- Right top-right

hs.hotkey.bind(shiftedMod, "R", hs.reload)

hs.alert.show("Config loaded")
