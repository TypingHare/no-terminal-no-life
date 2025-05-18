# MacOS Setup

```shell
# Remove apps from the Dock when closed
defaults write com.apple.dock show-recents -bool false
killall Dock

# Hide the Dock automatically
"Desktop & Dock" > "Automatically hide and show the Dock" > "On"

# Hide the menu bar automatically
"Control Center" > "Automatically hide and show the menu bar" > "Always"

# Minimize apps without animation
defaults write com.apple.dock minimize-to-application -bool true
killall Dock
```
