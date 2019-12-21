FROM balenalib/raspberrypi3-debian:buster

WORKDIR /root
ENV UDEV=1

RUN install_packages \
	steamlink \
	# steamlink deps, installing them manually stops steamlink
	# trying to interactively install them on first start
	libbsd0 \
	libdbus-1-3 \
	libevdev2 \
	libfontconfig1 \
	libfreetype6 \
	libglib2.0-0 \
	libgudev-1.0-0 \
	libinput10 \
	libjpeg62-turbo \
	libmtdev1 \
	libpng16-16 \
	libwacom2 \
	libx11-6 \
	libx11-xcb1 \
	libxau6 \
	libxcb1 \
	libxcb-xkb1 \
	libxdmcp6 \
	libxext6 \
	libxkbcommon0 \
	libxkbcommon-x11-0 \
	# steamlink deps it doesn't list
	xterm \
	zenity \
	# install xinit to actually have an env to run in
	xinit \
	xserver-xorg \
	xorg xinput xserver-xorg-legacy xserver-xorg-input-evdev xserver-xorg-input-libinput x11-xserver-utils \
	# xbox usb wireless adapter driver
	xboxdrv \
	# sound setup
	alsa-utils \
	pulseaudio \
	gstreamer1.0-x gstreamer1.0-plugins-good gstreamer1.0-pulseaudio gstreamer1.0-alsa gstreamer1.0-libav gstreamer1.0-gl gstreamer1.0-plugins-base \
	# drivers?
	firmware-misc-nonfree mesa-va-drivers mesa-vdpau-drivers libvdpau-va-gl1 \
	# dev
	vim

RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

COPY entry.sh .xinitrc ./


CMD ["/bin/bash", "/root/entry.sh"]
