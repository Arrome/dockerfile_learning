FROM centos:latest

MAINTAINER Arrome

ENV MYSQL_USER_PASSWORD=123456

COPY ["entrypoint","/entrypoint/"]

RUN curl http://mirrors.aliyun.com/repo/epel-7.repo -o /etc/yum.repos.d/epel.repo \
    #yum install wget -y \
    #&& wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo \
    && yum install mariadb mariadb-server -y

RUN rm -rf /var/cache/yum

EXPOSE 3306

ENTRYPOINT ["bash","/entrypoint/boot.sh"]