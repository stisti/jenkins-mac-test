#!/bin/bash

uninstall() {
    sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
    sleep 5
    
    sudo rm -f /Library/LaunchDaemons/org.jenkins-ci.plist
    
    sudo rm -rf /Applications/Jenkins \
    /Library/Documentation/Jenkins \
    "/Library/Application Support/Jenkins"
    
}

uninstall

sudo installer -pkg jenkins*.pkg -target /

