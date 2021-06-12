FROM ubuntu:20.04

ARG USER=devuser
ENV HOME /home/$USER

RUN apt update \
    && apt install -y  make python3-pip \
    && adduser --disabled-password --gecos "" $USER \
    && apt autoremove -y \
    && mkdir /workdir && chown $USER:$USER -R /workdir

USER $USER

RUN pip3 install --user ansible
ENV PATH $PATH:$HOME/.local/bin

WORKDIR /workdir

CMD ["bash"]
