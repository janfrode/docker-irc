# Docker container running IRC
Create a secure container for keeping my IRSSI client running at all times. 
No privleges, not setuid binaries, etc..

### Build
	docker build -t="janfrode/irc" .

### Run
	semanage fcontext -a -t docker_var_lib_t "/srv/docker(/.*)?"
	mkdir -p /srv/docker/irchome
	chown 6666:6666 /srv/docker/irchome
	restorecon -rv /srv/docker/
	docker run --volume=/srv/docker/irchome:/home/irc -t -i janfrode/irc runuser -l irc --session-command=/bin/irssi
