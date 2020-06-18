
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install curl gpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
RUN install -o root -m 644 /tmp/packages.microsoft.gpg /usr/share/keyrings/
RUN sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y install apt-transport-https && apt-get update && \
    apt-get -y install code daemontools
RUN apt-get -y install python3-distutils

RUN adduser --disabled-password --gecos ""  user

RUN code --install-extension platformio.platformio-ide --user-data-dir /home/user

CMD [ "code", "-w", "--user-data-dir", "/home/user" ]
