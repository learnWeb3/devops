FROM williamyeh/ansible:ubuntu18.04

RUN apt update
RUN apt install openssh-client -y
RUN apt install openssh-server -y
COPY ./id_rsa /root/.ssh
COPY ./id_rsa.pub /root/.ssh

WORKDIR /nsa

COPY ./ansible.cfg /nsa/ansible.cfg
COPY ./inventory /nsa/inventory
COPY ./main_playbook.yml /nsa/main_playbook.yml
COPY ./server_playbook.yml /nsa/server_playbook.yml
COPY ./database_playbook.yml /nsa/database_playbook.yml

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"] && ssh-add /root/.ssh/id_rsa