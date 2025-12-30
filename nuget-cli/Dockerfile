ARG DISTRO=ubuntu
ARG DISTRO_VERSION=noble
FROM ${DISTRO}:${DISTRO_VERSION} AS nuget

ARG MAINTAINER="Joachim Wickman <joachim@wickman.in>"
ARG DESCRIPTION="nuget in Ubuntu/Docker"
ARG VERSION=1.0
LABEL maintainer=${MAINTAINER}
LABEL version=${VERSION}
LABEL description=${DESCRIPTION}

LABEL org.opencontainers.image.authors=${MAINTAINER}
#LABEL org.opencontainers.image.url=${DOCKERFILE_URL}
#LABEL org.opencontainers.image.documentation=${DOCKERFILE_URL}
#LABEL org.opencontainers.image.source=${DOCKERFILE_URL}
LABEL org.opencontainers.image.version=${VERSION}
#LABEL org.opencontainers.image.licenses=${LICENSE}
LABEL org.opencontainers.image.description=${DESCRIPTION}

ARG NUGET_EXE_DOWNLOAD_URL="https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mono-complete \
    && rm -rf /var/lib/apt/lists/*

ADD ${NUGET_EXE_DOWNLOAD_URL} /usr/bin/

COPY <<EOF /usr/bin/nuget
#!/usr/bin/env bash
mono /usr/bin/nuget.exe
EOF

RUN chmod 755 /usr/bin/nuget

# # Little overhead.
# RUN echo 'alias nuget="mono /usr/bin/nuget.exe"' >> /etc/bash.bashrc

WORKDIR /var/cache/nuget

CMD [ "/usr/bin/env", "bash" ]
