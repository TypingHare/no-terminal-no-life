-- This AppleScript script is designed to toggle fullscreen mode for the 
-- frontmost iTerm window. It uses System Events to simulate the keystroke 
-- combination 
--
--     Control + Command + F
--
-- which is the default macOS shortcut for entering or exiting fullscreen mode. Use
-- osascript to run this script: 
--
--     osascript toggle_iterm_fullscreen.scpt
--
-- Created by James Chen (https://github.com/typinghare)
-- Created on 08/10/2024

tell application "iTerm"
    activate
    tell the current session of the front window
        tell application "System Events"
            keystroke "f" using {control down, command down}
        end tell
    end tell
end tell

