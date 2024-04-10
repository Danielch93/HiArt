#!/bin/bash
echo “Running pre-commit hook”
xcodebuild -quiet -workspace HiArt.xcworkspace -scheme HiArt -destination 'platform=iOS Simulator,name=iPhone 8,OS=16.4' test
if [ $? -ne 0 ]; then
 echo “Tests must pass before commit!”
 exit 1
fi 
