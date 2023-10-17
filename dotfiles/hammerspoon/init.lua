local bundleIDs = {
  browser = "com.google.Chrome",
  terminal = "com.googlecode.iterm2",
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

    if k ~= 1 and bundleID ~= bundleIDs.browser and bundleID ~=
      bundleIDs.terminal and bundleID ~= bundleIDs.hammerspoon then
      win:focus()
      return
    end
  end
end

local mod = {"command", "option", "shift"}

hs.hotkey.bind(mod, "1", focusNextOtherWindow)
hs.hotkey.bind(mod, "2", createFocusFunction(bundleIDs.browser))
hs.hotkey.bind(mod, "3", createFocusFunction(bundleIDs.browser))
hs.hotkey.bind(mod, "4", createFocusFunction(bundleIDs.terminal))

hs.hotkey.bind(mod, "r", hs.reload)

local usbWatcher = hs.usb.watcher.new(function(data)
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
