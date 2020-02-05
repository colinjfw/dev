#!/bin/sh
set -e

echo "==> Apk update"
echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
echo '@edgecommunity http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
apk update

echo "==> Adding packages"
apk add $(cat packages.txt)

echo "==> Running installers"
./installers/awscli.sh
./installers/kubernetes.sh

# From: https://github.com/dockage/alpine/blob/master/3.9/openrc/Dockerfile
# Sets up the base alpine openrc init system.
echo "==> Setting up init"
echo "  Removing gettys"
sed -i 's/^\(tty\d\:\:\)/#\1/g' /etc/inittab
echo "  Configuring openrc"
sed -i \
    -e 's/#rc_sys=".*"/rc_sys="docker"/g' \
    -e 's/#rc_env_allow=".*"/rc_env_allow="\*"/g' \
    -e 's/#rc_crashed_stop=.*/rc_crashed_stop=NO/g' \
    -e 's/#rc_crashed_start=.*/rc_crashed_start=YES/g' \
    -e 's/#rc_provide=".*"/rc_provide="loopback net"/g' \
    /etc/rc.conf
echo "  Removing unnecessary services"
rm -f /etc/init.d/hwdrivers \
    /etc/init.d/hwclock \
    /etc/init.d/hwdrivers \
    /etc/init.d/modules \
    /etc/init.d/modules-load \
    /etc/init.d/modloop
echo "  Removing cgroups"
sed -i 's/\tcgroup_add_service/\t#cgroup_add_service/g' /lib/rc/sh/openrc-run.sh
sed -i 's/VSERVER/DOCKER/Ig' /lib/rc/sh/init.sh

echo "==> Setup user"
echo "  Setup colin user as sudoer"
addgroup -S colin
adduser -S -G colin colin
echo 'colin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo "  Configure dotfiles"
cp -r dotfiles/. /home/colin
chown -R colin:colin /home/colin
addgroup -S colin docker

echo "==> Setup scripts"
cp -r bin/. /usr/local/bin

echo "==> Misc"
echo "Set disable_coredump false" >> /etc/sudo.conf

echo "==> Services"

cp -r init/devinit /etc/init.d/
rc-update add devinit default

echo '--- Done ---'
