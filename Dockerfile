FROM ubuntu:22.04

RUN apt update
RUN	apt install vim -y
RUN	apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring -y
RUN	echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \ http://nginx.org/packages/ubuntu `lsb_release -cs` nginx"
RUN	echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n"
RUN	apt update 
RUN	apt install nginx -y
