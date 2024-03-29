## └─[$]  
``` bash
curl -o do-bots.txt  https://www.digitalocean.com/robots.txt
scp ~/.vimrc k2@192.168.0.127:/Volumes/GoGo/WIP\ Master/K2\ Notes/.vimrc
```
MacOS specific:
- make sure that /opt/homebrew/bin is first in path


``` bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
MacOS specific:
- set key repeat and delay


``` bash
defaults write com.apple.finder DisableAnimations -bool true
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.vscodium ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false
defaults write com.google.android.studio ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 12
defaults write -g ApplePressAndHoldEnabled 0

```
MacOS specific:
- disable press and hold so editors can have key repeat


## Color & Terminal Control

``` bash
python3 -m pip install terminal-colors
terminal-colors -n  #list of current numbered color indexes, see the --help for more
```
