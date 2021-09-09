#!/bin/sh

curl -sSL https://dl.google.com/android/repository/$ANDROID_SDK_FILE | bsdtar -xf - -C $ANDROID_HOME
chmod +x $ANDROID_HOME/tools/bin/*
sdkmanager --update
yes | sdkmanager --licenses
sdkmanager "build-tools;27.0.1" "platform-tools" "platforms;android-27" "ndk;23.0.7599858"
