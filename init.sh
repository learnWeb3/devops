# /bin/bash
IMAGE_NAME=ubuntuvm

# VM names
VM1_LABEL=vm1
VM2_LABEL=vm2
VM3_LABEL=vm3

# build image
docker build --tag "${IMAGE_NAME}" ./

# lauch vms 
docker run --privileged --name "${VM1_LABEL}" -p 2022:22 -dit "${IMAGE_NAME}" 
docker run --privileged --name "${VM2_LABEL}" -p 2023:22 -dit "${IMAGE_NAME}" 
docker run --privileged --name "${VM3_LABEL}" -p 2024:22 -dit "${IMAGE_NAME}" 

# copy public key to /.ssh/authorized_keys
sshpass -p test ssh-copy-id -p 2022 -i ./id_rsa.pub test@localhost
sshpass -p test ssh-copy-id -p 2023 -i ./id_rsa.pub test@localhost
sshpass -p test ssh-copy-id -p 2024 -i ./id_rsa.pub test@localhost

# add private key to agent
ssh-add ./id_rsa
# lauch ssh session to an host
ssh test@localhost -p 2022

# VM1_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "${VM1_LABEL}")
# VM2_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "${VM2_LABEL}")
# VM3_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "${VM3_LABEL}")

# echo "VM1 IP is ${VM1_IP}"
# echo "VM2 IP is ${VM2_IP}"
# echo "VM3 IP is ${VM3_IP}"