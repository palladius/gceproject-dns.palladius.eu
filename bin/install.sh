#!/bin/sh

# installs a cron job to update this automagically :)
cat > /etc/cron.d/riccardo-auto-update-bind <<EOF
# this is installed automatically by the dns.palladius.eu gceservice:
# git@github.com:palladius/gceproject-dns.palladius.eu.git

PATH=\$PATH:/usr/bin/
 * * * * *  root     cd /etc/bind && git pull origin master && service bind9 reload && touch /etc/bind/cron-updated-direct.touch  || touch /etc/bind/cron-updated-direct-error-$?.touch
 * * * * *  root     /etc/bind/bin/auto-update-bind
EOF
echo Installed crontab in: /etc/cron.d/riccardo-auto-update-bind 
