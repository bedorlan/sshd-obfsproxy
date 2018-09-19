echo "root:${rootpasswd:-root}" | chpasswd

/usr/sbin/sshd
exec obfsproxy obfs3 --dest=127.0.0.1:22 server 0.0.0.0:443
