#!/bin/sh

# installs a cron job to update this automagically :)
cat > /etc/cron.d/auto-update-bind <<EOF
*/7 * * * *  root     cd /etc/bind && git pull origin master && service bind9 reload && touch /etc/bind/cron-updated.touch
EOF
echo Installed crontab in: /etc/cron.d/auto-update-bind 