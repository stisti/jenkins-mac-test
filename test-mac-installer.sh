#!/bin/bash -ex

uninstall() {
    sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist || true
    sleep 5
    
    sudo rm -f /Library/LaunchDaemons/org.jenkins-ci.plist
    
    sudo rm -rf /Applications/Jenkins \
    /Library/Documentation/Jenkins \
    "/Library/Application Support/Jenkins"
    
    osascript -e 'tell application "Safari" to close every window'
    osascript -e 'tell application "Activity Monitor" to activate'
}

uninstall

sudo installer -pkg jenkins*.pkg -target /

curl -sf -D /dev/stderr http://localhost:8080/ 2>&1 >/dev/null | tr -d '\015' | grep X-Jenkins:
