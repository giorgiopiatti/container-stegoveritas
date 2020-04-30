FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt dist-upgrade -y && \
    apt install -y git python3 python3-pip python3-venv wget && \
    mkdir -p /opt

RUN git clone https://github.com/bannsec/stegoVeritas /opt/stegoveritas/

RUN cd /opt/stegoveritas && pip3 install -e .[dev] && \
    stegoveritas_install_deps

# oh-my-zsh
RUN apt -y install zsh && echo "y" | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

WORKDIR /home/
CMD ["zsh"]