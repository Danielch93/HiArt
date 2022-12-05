#!/bin/bash
echo “Running pre-commit hook”
xcodebuild -quiet -workspace HiArt.xcworkspace -scheme HiArt -destination 'platform=iOS Simulator,name=iPhone 12,OS=14.4' test
if [ $? -ne 0 ]; then
 echo “Tests must pass before commit!”
 exit 1
fi
