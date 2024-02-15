# ubuntu-nginx

```
- apt install vim


1. sudo docker pull ubuntu:22.04
2. sudo docker run -it -p 8083:80 ubuntu:22.04
3. apt update
4. apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
5. curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
6. gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
   - pub   rsa2048 2011-08-19 [SC] [expires: 2024-06-14]
      573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
      uid                      nginx signing key <signing-key@nginx.com>
7. echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
    http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list


8. echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | sudo tee /etc/apt/preferences.d/99nginx

```
sudo apt update
sudo apt install nginx

# nginx 설치 완료 후
```
nginx -v

service nginx start

cd /var/www/html/
vi index.nginx-debian.html
```
# Dockerfile
```
FROM ubuntu:22.04

RUN apt update
RUN     apt install vim -y
RUN     apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring -y
RUN     echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \ http://nginx.org/packages/ubuntu `lsb_release -cs` nginx"
RUN     echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n"
RUN     apt update
RUN     apt install nginx -y
```
# Docker hun url 배포
https://hub.docker.com/repository/docker/jeonseungmin/ubuntu_nginx-dockerfile/tags?page=1&ordering=last_updated
