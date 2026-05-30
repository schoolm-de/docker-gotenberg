FROM gotenberg/gotenberg:8.33.0-libreoffice

USER root

RUN echo "deb http://deb.debian.org/debian trixie contrib non-free" \
      > /etc/apt/sources.list.d/contrib.list \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" \
      | debconf-set-selections \
    && apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
         ca-certificates \
         wget \
         ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/*

USER gotenberg
