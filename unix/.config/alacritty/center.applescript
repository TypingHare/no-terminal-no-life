tell application "Finder"
    -- Get the screen dimensions from Finder's desktop bounds
    set screenBounds to bounds of window of desktop
    set screenWidth to item 3 of screenBounds
    set screenHeight to item 4 of screenBounds
end tell

tell application "System Events"
    tell process "Alacritty"
        -- Get the window dimensions
        set windowSize to get size of window 1
        set windowWidth to item 1 of windowSize
        set windowHeight to item 2 of windowSize
        
        -- Calculate the center position
        set newX to (screenWidth - windowWidth) / 2
        set newY to (screenHeight - windowHeight) / 2
        
        -- Set the position of the window
        set position of window 1 to {newX, newY}
    end tell
end tell
