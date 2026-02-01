local bundleIDs = {
  browser = "com.google.Chrome",
  terminal = "net.kovidgoyal.kitty",
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

local function moveBrowser()
  local win = getMainWindow(bundleIDs.browser)
  if win then
    local screen = win:screen()
    local nextScreen = screen:next()

    if screen:id() == nextScreen:id() then
      return
    end

    if nextScreen:name() == "Built-in Retina Display" then
      win:move(nextScreen:frame(), nextScreen, true, 0)
      win:focus()

    elseif nextScreen:name() == "DELL S2719DC" then
      local currentFrame = win:frame()
      local nextScreenFrame = nextScreen:frame()
      local frame = hs.geometry.rect(nextScreenFrame.x + 0.5 *
                                       (nextScreenFrame.w - currentFrame.w),
                      nextScreenFrame.y, currentFrame.w, nextScreenFrame.h)
      win:move(frame, nextScreen, true, 0)
      win:focus()
    end
  end
end

local mod = {"command", "option", "shift"}

hs.hotkey.bind(mod, "1", moveBrowser)
hs.hotkey.bind(mod, "2", createFocusFunction(bundleIDs.browser))
hs.hotkey.bind(mod, "3", createFocusFunction(bundleIDs.terminal))
hs.hotkey.bind(mod, "4", moveBrowser)

local usbWatcher = hs.usb.watcher.new(function(data)
  if data.productName == "Voyager" then
    if data.eventType == "added" then
      hs.keycodes.setLayout("British")
    else
      hs.keycodes.setLayout("Programmer Dvorak")
    end
  end
end)

usbWatcher:start()
