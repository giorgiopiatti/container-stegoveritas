FROM bannsec/stegoveritas

ARG DEBIAN_FRONTEND=noninteractive

# Clean stegoveritas user
USER root
WORKDIR /home/
RUN userdel stegoveritas && rm -r /home/stegoveritas

# oh-my-zsh
RUN apt update && apt dist-upgrade -y && \
    apt install -y wget git
   
RUN apt -y install zsh && echo "y" | sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

CMD ["zsh"]