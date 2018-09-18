FROM alpine:latest

RUN apk add --no-cache openssh-server py2-pip gcc libc-dev python2-dev
RUN pip install --upgrade --no-cache-dir pip
RUN pip install --no-cache-dir obfsproxy

RUN ssh-keygen -A
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd

EXPOSE 443
COPY start.sh .
CMD ["sh", "start.sh"]
