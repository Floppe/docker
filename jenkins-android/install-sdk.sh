#!/bin/sh

curl -sSL https://dl.google.com/android/repository/$ANDROID_SDK_FILE | bsdtar -xf - -C $ANDROID_HOME
chmod +x $ANDROID_HOME/tools/bin/*
sdkmanager --update
yes | sdkmanager --licenses
sdkmanager "build-tools;30.0.3" "platform-tools" "platforms;android-31" "ndk;25.1.8937393"
