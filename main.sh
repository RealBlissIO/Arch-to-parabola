#!/bin/sh
#

if su -c "pacman -Syu"; then
	sed -i 's/SigLevel = Required DatabaseOptional/SigLevel = Never/g' /etc/pacman.conf &&
	pacman -U https://www.parabola.nu/packages/libre/x86_64/parabola-keyring/download && 
	pacman -U https://www.parabola.nu/packages/libre/x86_64/pacman-mirrorlist/download &&
	sed -i 's/SigLevel = Never/SigLevel = Required DatabaseOptional/g' /etc/pacman.conf &&
	cp -vr /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist &&
	wget https://git.parabola.nu/abslibre.git/plain/libre/pacman/pacman.conf.$(uname -m) &&
	cp /etc/pacman.conf /etc/pacman.conf.orig &&
	mv pacman.conf.$(uname -m) /etc/pacman.conf && 
	(sed -i '/\[libre\]/i Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf 
	sed -i '/\[pcr\]/i Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf 
	sed -i '/\[kernels\]/i Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf
	sed -i '/\[nonprism\]/i Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf 
	if ! pidof systemd >/dev/null; then
    		sed -i '/\[nonsystemd\]/i Include = /etc/pacman.d/mirrorlist' /etc/pacman.conf
		fi) &&
	pacman -Scc &&
	pacman -Syy &&
	pacman-key --refresh &&
	pacman -Suu your-freedom pacman your-privacy &&
	grub-mkconfig -o /boot/grub/grub.cfg &&
	echo "Script executed successfully."
else
	echo "Script failed....:("
fi
