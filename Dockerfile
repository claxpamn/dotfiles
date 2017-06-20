FROM debian

RUN apt-get update
RUN apt-get install -y git zsh tmux stow

RUN adduser dot --disabled-password --gecos ""
RUN echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dot
ENV HOME /home/dot
ENV WORKSPACE $HOME/workspace

RUN mkdir $WORKSPACE
RUN git clone --recursive https://github.com/claxpamn/dotfiles $WORKSPACE/dotfiles

WORKDIR $HOME
