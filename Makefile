#!/usr/bin/make
# Zur Erstellung des Debian-Pakets notwendig (make DESTDIR=/root/sophomorix)
# Created by Rüdiger Beck (jeffbeck-at-web.de)
DESTDIR=

SHARE=$(DESTDIR)/usr/share/linuxmuster-client-sudoers


help:
	@echo ' '
	@echo 'Most common options of this Makefile:'
	@echo '-------------------------------------'
	@echo ' '
	@echo '   make deb'
	@echo '      create a debian package'
	@echo ' '


default: 
	@echo 'Doing Nothing'


install:
	@echo '   * Installing ...'
	@install -d -m0755 -oroot -groot $(SHARE)
	@install -oroot -groot --mode=0644 sudoers.d/10-linuxmuster-client-teachers-all $(SHARE)

deb:
	### deb
	dpkg-buildpackage -tc -uc -us -sa -rfakeroot
	@echo ''
	@echo 'Do not forget to tag this version in git. Have you done a dch -i?'
	@echo ''


clean:
	rm -rf  debian/linuxmuster-client-sudoers



