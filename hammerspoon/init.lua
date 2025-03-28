local hyper = {"cmd", "alt", "ctrl", "shift"}


-- Function to open or focus an app
function openOrFocusApp(appName)
    local app = hs.application.get(appName)
    if app and app:isFrontmost() then
        app:hide()  -- Hide app if it's already focused
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Bind Hyper + Key to open apps
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "T", function() openOrFocusApp("iTerm") end) -- iTerm2
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "F", function() openOrFocusApp("Firefox") end) -- Firefox
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "I", function()
    hs.application.launchOrFocus("/Users/karoljanowski/Applications/IntelliJ IDEA Community Edition.app")
end)
-- Bind Hyper + C to open or focus ChatGPT Desktop Version
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "C", function()
    openOrFocusApp("ChatGPT")  -- Replace "ChatGPT" with the exact app name as shown in Activity Monitor
end)

-- 🔲 Window Management
hs.hotkey.bind(hyper, "Left", function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(hs.layout.left50) end
end)

hs.hotkey.bind(hyper, "Right", function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(hs.layout.right50) end
end)

hs.hotkey.bind(hyper, "Up", function()
    local win = hs.window.focusedWindow()
    if win then win:maximize() end
end)

hs.hotkey.bind(hyper, "Down", function()
    local win = hs.window.focusedWindow()
    if win then win:minimize() end
end)