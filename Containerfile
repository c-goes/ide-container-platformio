
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install curl gpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y install apt-transport-https && apt-get update && \
    apt-get -y install code
RUN apt-get -y install python3-distutils sudo libx11-xcb-dev libasound2-dev build-essential bash fish libxcb-dri3-dev libdrm2 libgbm1
#RUN python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

RUN adduser --disabled-password --gecos ""  user

RUN code --install-extension platformio.platformio-ide --user-data-dir /root


CMD [ "code", "-w", "--user-data-dir", "/root/.vscode-root" ]
