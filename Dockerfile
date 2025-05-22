FROM alpine:3.18

RUN apk update && \
    apk add openssh && \
    adduser -D muleuser && \
    echo "muleuser:mulepass" | chpasswd && \
    mkdir -p /home/muleuser/upload && \
    chown muleuser:muleuser /home/muleuser/upload && \
    echo "PermitRootLogin no\nPasswordAuthentication yes\nSubsystem sftp internal-sftp\n" > /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
