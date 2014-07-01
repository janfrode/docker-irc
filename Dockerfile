#
FROM fedora:rawhide
MAINTAINER Jan-Frode Myklebust <janfrode@tanso.net>

RUN yum -y install irssi findutils
RUN yum -y update
# Drop all setuid setgid permissions:
RUN find /usr -perm /6000 -exec chmod -s '{}' \;
RUN groupadd -g 6666 irc
RUN adduser -c "Jan-Frode Myklebust" -u 6666 -g 6666 irc
