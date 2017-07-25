##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution

GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-15 \
	gluon-respondd \
	respondd-module-airtime \
	gluon-alfred \
	gluon-autoupdater \
	gluon-config-mode-autoupdater \
	gluon-config-mode-core \
	gluon-config-mode-geo-location \
	gluon-config-mode-mesh-vpn \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-web-admin \
	gluon-web-autoupdater \
	gluon-web-network \
	gluon-web-wifi-config \
	gluon-web-private-wifi \
	gluon-radvd \
	gluon-setup-mode \
	gluon-status-page \
	haveged \
	iptables \
	iwinfo \
	gluon-config-mode-contact-info \
	gluon-mesh-vpn-core
	
# from ffslfl-packages:
GLUON_SITE_PACKAGES += \
	fff-random \
	ffslfl-fastd \
	ffslfl-tunneldigger \
	ffslfl-vpn-select \
	tunneldigger

# from ffki-packages:
GLUON_SITE_PACKAGES += \
	gluon-config-mode-ppa \
	gluon-config-mode-hostname-no-pretty

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := develop-2017.1.x-$(shell date '+%Y%m%d')

DEFAULT_GLUON_BRANCH=experimental

##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)
GLUON_BRANCH ?= $(DEFAULT_GLUON_BRANCH)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= en de

GLUON_ATH10K_MESH ?= 11s

# basic support the USB stack
#USB_PACKAGES_BASIC := \
#	kmod-usb-core \
#	kmod-usb2

# support for USB UMTS/3G devices
USB_PACKAGES_3G := \
	kmod-usb-serial \
	kmod-usb-serial-wwan \
	kmod-usb-serial-option \
	chat \
	ppp

# support for USB GPS devices
USB_PACKAGES_GPS := \
	kmod-usb-acm \
	ugps

# support for HID devices (keyboard, mouse, ...)
USB_PACKAGES_HID := \
	kmod-usb-hid \
	kmod-hid-generic

# support for USB tethering
USB_PACKAGES_TETHERING := \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether

USB_X86_GENERIC_NETWORK_MODULES := \
	kmod-usb-ohci-pci \
	kmod-sky2 \
	kmod-atl2 \
	kmod-igb \
	kmod-3c59x \
	kmod-e100 \
	kmod-e1000 \
	kmod-e1000e \
	kmod-natsemi \
	kmod-ne2k-pci \
	kmod-pcnet32 \
	kmod-8139too \
	kmod-r8169 \
	kmod-sis900 \
	kmod-tg3 \
	kmod-via-rhine \
	kmod-via-velocity \
	kmod-forcedeth

# storage support for USB
USB_PACKAGES_STORAGE := \
	block-mount \
	kmod-fs-ext4 \
	kmod-fs-vfat \
	kmod-usb-storage \
	kmod-usb-storage-extras \
	blkid \
	swap-utils \
	kmod-nls-cp1250 \
	kmod-nls-cp1251 \
	kmod-nls-cp437 \
	kmod-nls-cp775 \
	kmod-nls-cp850 \
	kmod-nls-cp852 \
	kmod-nls-cp866 \
	kmod-nls-iso8859-1 \
	kmod-nls-iso8859-13 \
	kmod-nls-iso8859-15 \
	kmod-nls-iso8859-2 \
	kmod-nls-koi8r \
	kmod-nls-utf8
# from ffki-packages:
#USB_PACKAGES_STORAGE += \
#	gluon-usb-media \
#	gluon-config-mode-usb-media

# add addition network drivers and usb stuff only to targes where disk space does not matter
ifeq ($(GLUON_TARGET),x86-generic)
	# support the USB stack on x86 devices
	# and add a few common USB NICs
	GLUON_SITE_PACKAGES += \
#		$(USB_PACKAGES_STORAGE) \
		$(USB_PACKAGES_HID) \
		$(USB_PACKAGES_TETHERING) \
		$(USB_PACKAGES_3G) \
		$(USB_PACKAGES_GPS) \
		$(USB_X86_GENERIC_NETWORK_MODULES)
endif

#ifeq ($(GLUON_TARGET),ar71xx-generic)
#	GLUON_TLWR1043_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWR842_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWDR4300_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_TLWR2543_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WRT160NL_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_DIR825B1_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_DIR505A1_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_GLINET_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WNDR3700_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WZRHPG450H_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_WZRHPAG300H_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#	GLUON_ARCHERC7_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#endif

#ifeq ($(GLUON_TARGET),mpc85xx-generic)
#	GLUON_TLWDR4900_SITE_PACKAGES := $(USB_PACKAGES_STORAGE)
#endif
