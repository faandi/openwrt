
#
# Copyright (C) 2009 Brice DUBOST
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#
# !!!! This is a generated file !!!! 
#

DVB_MENU:=DVB support

#
# General section
#

define KernelPackage/dvb-core
  SUBMENU:=$(DVB_MENU)
  TITLE:=DVB core support
  DEPENDS:=+kmod-i2c-core
  KCONFIG:= \
	CONFIG_MEDIA_SUPPORT \
	CONFIG_DVB_CORE \
	CONFIG_DVB_CAPTURE_DRIVERS=y \
	CONFIG_MEDIA_TUNER_CUSTOMIZE=y \
	CONFIG_DVB_FE_CUSTOMISE=y \
	CONFIG_DVB_DYNAMIC_MINORS=n \
	CONFIG_CRC32 
  FILES:=$(LINUX_DIR)/drivers/media/dvb/dvb-core/dvb-core.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,50,dvb-core)
endef

define KernelPackage/dvb-core/description
 Kernel module for DVB support
endef

$(eval $(call KernelPackage,dvb-core))


define KernelPackage/dvb-usb
  SUBMENU:=$(DVB_MENU)
  TITLE:=DVB USB Support
  DEPENDS:=@USB_SUPPORT +kmod-dvb-core +kmod-usb-core
  KCONFIG:= \
	CONFIG_DVB_USB \
	CONFIG_RC_CORE=y	
  FILES:=$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb.$(LINUX_KMOD_SUFFIX)
#  AUTOLOAD:=$(call AutoLoad,55,dvb-usb)
endef

define KernelPackage/dvb-usb/description
 Kernel module for DVB USB devices. Note you have to select at least a device.
endef

$(eval $(call KernelPackage,dvb-usb))

#
# Devices section
#

define KernelPackage/dvb-usb-em28xx
  SUBMENU:=$(DVB_MENU)
  TITLE:=DVB/ATSC Support for em28xx based TV cards
  KCONFIG:= CONFIG_VIDEO_EM28XX_DVB \
        CONFIG_DVB_LGDT330X \
        CONFIG_DVB_ZL10353 \
        CONFIG_DVB_TDA10023 \
        CONFIG_DVB_S921 \
        CONFIG_DVB_DRXD \
        CONFIG_DVB_CXD2820R \
        CONFIG_DVB_DRXK \
        CONFIG_DVB_TDA18271C2DD \
        CONFIG_DVB_TDA10071 \
        CONFIG_DVB_A8293 \
        CONFIG_VIDEOBUF_DVB \
	VIDEOBUF_GEN
  DEPENDS:=+kmod-dvb-usb +kmod-video-em28xx
  FILES:= $(LINUX_DIR)/drivers/media/video/em28xx/em28xx-dvb.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/video/videobuf-dvb.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/lgdt330x.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/tda10023.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/s921.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/drxk.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/cxd2820r.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/tda18271c2dd.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/tda10071.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/dvb/frontends/a8293.$(LINUX_KMOD_SUFFIX) \
        $(LINUX_DIR)/drivers/media/common/tuners/tda18271.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-em28xx/description
 DVB/ATSC Support for em28xx based TV cards
endef

$(eval $(call KernelPackage,dvb-usb-em28xx))



define KernelPackage/dvb-usb-af9015
  SUBMENU:=$(DVB_MENU)
  TITLE:=Afatech AF9015 DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_AF9015 \
	CONFIG_DVB_AF9013 \
	CONFIG_DVB_PLL \
	CONFIG_MEDIA_TUNER_MT2060 \
	CONFIG_MEDIA_TUNER_QT1010 \
	CONFIG_MEDIA_TUNER_TDA18271 \
	CONFIG_MEDIA_TUNER_MXL5005S \
	CONFIG_MEDIA_TUNER_MC44S803 \
	CONFIG_MEDIA_TUNER_TDA18218 \
	CONFIG_MEDIA_TUNER_MXL5007T \
	CONFIG_MEDIA_TUNER_CUSTOMISE=y
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-af9015.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/af9013.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tda18271.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5005s.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mc44s803.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tda18218.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5007t.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-af9015/description
 Say Y here to support the Afatech AF9015 DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-af9015 af9013 dvb-pll mt2060 qt1010 tda18271 mxl5005s mc44s803 tda18218 mxl5007t
You have to put the firmware files in the download dir : dvb-usb-af9015.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_AF9015_FW_0:=dvb-usb-af9015.fw

define KernelPackage/dvb-usb-af9015/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_AF9015_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-af9015))
