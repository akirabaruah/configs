# Preferences

Run these commands to set up iterm preferences. This won't sync profiles.

```sh
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefFromCustomFolder -bool true
```

# Profiles

Go to `Preferences > Profiles` and select `Other Actions`, then:

- `Import JSON profiles...` to *import*
- `Save Profile as JSON...` to *export*
