FROM python:3.12.2-bookworm


ARG USERNAME=vscode
ARG USER_UID=1001
ARG USER_GID=$USER_UID

# Install SSH server
RUN apt-get update \
    && apt-get install -y fish vim git curl neovim sudo openssh-server \
       ca-certificates \
       libpq-dev \
       gcc \
       gnupg \
       locales \
       python-is-python3 \
       python3-pip \
       python3-pycurl \
    && pip install git+https://github.com/ozlevka/parler-tts.git \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME  \
    && service ssh start 

COPY ./container.pub /home/${USERNAME}/.ssh/
COPY sshd_config /etc/ssh/
COPY entrypoint.sh /

RUN mv /home/${USERNAME}/.ssh/container.pub /home/${USERNAME}/.ssh/authorized_keys  \
    && chown -R 1001:1001 /home/${USERNAME}/.ssh/ \
    && chmod 0600 /home/${USERNAME}/.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT [ "/entrypoint.sh" ]


