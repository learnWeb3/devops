FROM ubuntu:20.04

RUN apt update
RUN apt upgrade -y
RUN apt install openssh-server -y
RUN apt install sudo -y

RUN wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O /usr/local/bin/systemctl

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN  echo 'test:test' | chpasswd

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]