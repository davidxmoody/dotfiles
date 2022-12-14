local bundleIDs = {
  chrome = "com.google.Chrome",
  iterm = "com.googlecode.iterm2",
  slack = "com.tinyspeck.slackmacgap",
  simulator = "com.apple.iphonesimulator",
  hammerspoon = "org.hammerspoon.Hammerspoon",
}

local function getMainWindow(bundleID, quiet)
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

local function createFocusFunction(bundleID)
  return function()
    local win = getMainWindow(bundleID)
    if win then
      win:focus()
    end
  end
end

local function focusNextOtherWindow()
  for k, win in pairs(hs.window.orderedWindows()) do
    local bundleID = win:application():bundleID()

    if k ~= 1 and bundleID ~= bundleIDs.chrome and bundleID ~= bundleIDs.iterm and
      bundleID ~= bundleIDs.hammerspoon and bundleID ~= bundleIDs.slack then
      win:focus()
      return
    end
  end
end

local mod = {"option"}
local shiftedMod = {"option", "shift"}

hs.hotkey.bind(mod, "g", focusNextOtherWindow)
hs.hotkey.bind(mod, "c", createFocusFunction(bundleIDs.chrome))
hs.hotkey.bind(mod, "r", createFocusFunction(bundleIDs.iterm))
hs.hotkey.bind(mod, "l", createFocusFunction(bundleIDs.slack))

hs.hotkey.bind(shiftedMod, "r", hs.reload)

local usbWatcher = hs.usb.watcher.new(function (data)
  if data.productName == "Moonlander Mark I" then
    if data.eventType == "added" then
      hs.keycodes.setLayout("U.S.")
    else
      hs.keycodes.setLayout("Programmer Dvorak")
    end
  end
end)

usbWatcher:start()

hs.alert.show("Hammerspoon loaded")
