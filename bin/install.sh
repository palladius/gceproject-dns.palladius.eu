#!/bin/sh

# installs a cron job to update this automagically :)
cat > /etc/cron.d/auto-update-bind <<EOF
5 * * * *  root     cd /etc/bind && git pull origin master && service bind reload && touch /etc/bind/cron-updated.touch
EOF

