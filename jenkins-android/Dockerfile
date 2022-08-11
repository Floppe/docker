FROM jenkins/jenkins:lts

MAINTAINER Joachim Wickman <joachim@wickman.in>

ENV JAVA_ARGS="-Dorg.apache.commons.jelly.tags.fmt.timeZone=Europe/Helsinki"
ENV ANDROID_SDK_FILE=sdk-tools-linux-4333796.zip
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_SDK_HOME=$ANDROID_HOME
ENV PATH=$PATH:$ANDROID_HOME/tools/bin

USER root
RUN apt-get update -qq && apt-get install -y lib32stdc++6 lib32z1 nuget libunwind-dev && \
mkdir $ANDROID_HOME && chown jenkins $ANDROID_HOME

# download SDK, install tools
ADD install-sdk.sh /
USER jenkins
