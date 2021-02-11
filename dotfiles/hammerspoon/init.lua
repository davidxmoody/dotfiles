-- Constants ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

bundleIDs = {
  chrome = "com.google.Chrome",
  iterm = "com.googlecode.iterm2",
  slack = "com.tinyspeck.slackmacgap",
  simulator = "com.apple.iphonesimulator",
  hammerspoon = "org.hammerspoon.Hammerspoon",
}

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

function focusChrome()
  local win = getMainWindow(bundleIDs.chrome)
  win:focus()
end

function focusIterm()
  local win = getMainWindow(bundleIDs.iterm)
  win:focus()
end

function focusSlack()
  local win = getMainWindow(bundleIDs.slack)
  win:focus()
end

-- function focusSimulatorAndChrome()
--   local simulatorWin = getMainWindow(bundleIDs.simulator, true)
--   local chromeWin = getMainWindow(bundleIDs.chrome, true)
--   if simulatorWin ~= nil then simulatorWin:focus() end
--   if chromeWin ~= nil then chromeWin:focus() end
-- end

function focusNextOtherWindow()
  for k, win in pairs(hs.window.orderedWindows()) do
    bundleID = win:application():bundleID()

    if
      k ~= 1 and
      bundleID ~= bundleIDs.chrome and
      bundleID ~= bundleIDs.iterm and
      bundleID ~= bundleIDs.hammerspoon and
      bundleID ~= bundleIDs.slack
    then
      win:focus()
      return
    end
  end
end

-- Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mod = {"option"}
shiftedMod = {"option", "shift"}

hs.hotkey.bind(mod, "g", focusNextOtherWindow)
hs.hotkey.bind(mod, "c", focusChrome)
hs.hotkey.bind(mod, "r", focusIterm)
hs.hotkey.bind(mod, "l", focusSlack)

hs.hotkey.bind(shiftedMod, "r", hs.reload)

hs.alert.show("Config loaded")
