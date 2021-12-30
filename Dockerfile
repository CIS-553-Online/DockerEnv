# Fetch ubuntu 20.04 LTS docker image
FROM ubuntu:20.04

# Remove diverted man binary to prevent man-pages being replaced with "minimized" message.
# https://github.com/CIS380/docker-env/wiki/Install-man-page
RUN if  [ "$(dpkg-divert --truename /usr/bin/man)" = "/usr/bin/man.REAL" ]; then \
        rm -f /usr/bin/man; \
        dpkg-divert --quiet --remove --rename /usr/bin/man; \
    fi

RUN sed -i 's,^path-exclude=/usr/share/man/,#path-exclude=/usr/share/man/,' /etc/dpkg/dpkg.cfg.d/excludes

RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y software-properties-common && \
apt-get install -y clang && \
apt-get install -y emacs && \
apt-get install -y gdb && \
apt-get install -y gcc && \
apt-get install -y make && \
apt-get install -y valgrind && \
apt-get install -y vim && \
apt-get install -y python3 && \
apt-get install -y python3-pip &&\
apt-get install -y wget && \
apt-get install -y lsb-release && \
apt-get install -y net-tools && \
apt-get install -y apt-transport-https apt-utils && \
apt-get install -y man man-db manpages-posix manpages-dev manpages-posix-dev && \
apt-get install -y libssl-dev && \
apt-get install -y sudo && \
rm -rf /var/lib/apt/lists/*

RUN apt install -y g++-9 gcc-9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9

# Setting up cis553 as the user 
ARG GID=1000
ARG UID=1000
RUN addgroup --gid $GID cis553
RUN useradd --system --create-home --shell /bin/bash --groups sudo -p "$(openssl passwd -1 mcit)" --uid $UID --gid $GID cis553
RUN wget -O /root/.vimrc https://raw.githubusercontent.com/CIS548/gists/master/example_vimrc.txt
RUN cp /root/.vimrc /home/cis553/.vimrc
RUN chown cis553:cis553 /home/cis553/.vimrc
USER cis553
WORKDIR /home/cis553/
