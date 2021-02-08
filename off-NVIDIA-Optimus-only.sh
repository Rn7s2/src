#!/bin/sh

mv /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf /root/10-nvidia-drm-outputclass.conf
mv /home/rn7s2/.xsessionrc .xsessionrc.bak
mv /usr/share/gdm/greeter/autostart/optimus.desktop /usr/share/gdm/greeter/autostart/optimus.desktop.bak
