FROM jenkins/jenkins:lts

ARG MAINTAINER="Joachim Wickman <joachim@wickman.in>"
ARG DESCRIPTION="Jenkins with Docker and Android SDK"
ARG VERSION=1.0

LABEL maintainer=${MAINTAINER}
LABEL version=${VERSION}
LABEL description=${DESCRIPTION}

ENV JAVA_ARGS="-Dorg.apache.commons.jelly.tags.fmt.timeZone=Europe/Helsinki"
ENV ANDROID_SDK_FILE=commandlinetools-linux-10406996_latest.zip
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_SDK_HOME=$ANDROID_HOME
ENV PATH=$PATH:$ANDROID_HOME/tools/bin

USER root

RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

RUN apt-get update -qq && apt-get install -y lib32stdc++6 lib32z1 libunwind-dev iproute2 iputils-ping libicu-dev lynx docker.io && \
mkdir $ANDROID_HOME && chown jenkins $ANDROID_HOME

# download SDK, install tools
ADD install-sdk.sh /
USER jenkins
