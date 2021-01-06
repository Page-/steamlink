FROM balenalib/raspberrypi3-debian:buster

WORKDIR /root
ENV UDEV=1

RUN apt-get update && apt-get upgrade && install_packages \
	steamlink \
	# steamlink deps, installing them manually stops steamlink
	# trying to interactively install them on first start
	cec-utils \
	openssl \
	libblkid1:armhf \
	libbsd0:armhf \
	libc6:armhf \
	libdbus-1-3:armhf \
	libevdev2:armhf \
	libexpat1:armhf \
	libffi6:armhf \
	libfontconfig1:armhf \
	libfreetype6:armhf \
	libgcc1:armhf \
	libgcrypt20:armhf \
	libglib2.0-0:armhf \
	libgpg-error0:armhf \
	libgudev-1.0-0:armhf \
	libinput10:armhf \
	libjpeg62-turbo:armhf \
	liblz4-1:armhf \
	liblzma5:armhf \
	libmount1:armhf \
	libmtdev1:armhf \
	libpcre3:armhf \
	libpng16-16:armhf \
	libraspberrypi0:armhf \
	libselinux1:armhf \
	libstdc++6:armhf \
	libsystemd0:armhf \
	libudev1:armhf \
	libusb-1.0-0:armhf \
	libuuid1:armhf \
	libwacom2:armhf \
	libx11-6:armhf \
	libx11-xcb1:armhf \
	libxau6:armhf \
	libxcb-xkb1:armhf \
	libxcb1:armhf \
	libxdmcp6:armhf \
	libxext6:armhf \
	libxkbcommon-x11-0:armhf \
	libxkbcommon0:armhf \
	zlib1g:armhf \
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
