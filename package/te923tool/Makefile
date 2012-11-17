#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=te923tool
PKG_VERSION:=0.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://te923.fukz.org/downloads/
PKG_MD5SUM:=160c53e9377cdc17175bda9d8329ef62

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/te923tool
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libusb
	TITLE:=read usb weather station data with te923con
	URL:=http://te923.fukz.org
endef

define Package/te923tool/description
	The te923tool supports most weather stations based on Hideki weather station like IROX Pro X, 
	Mebus TE923 or TFA Nexus. Some other hardware is supported but not all devices are testet yet.
endef


define Build/Compile
        $(TARGET_CC) $(TARGET_CFLAGS) -Wall -lusb \
                -o $(PKG_BUILD_DIR)/te923con $(PKG_BUILD_DIR)/te923con.c $(PKG_BUILD_DIR)/te923usb.c $(PKG_BUILD_DIR)/te923com.c
endef


define Package/te923tool/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/te923con $(1)/usr/bin/	
endef

$(eval $(call BuildPackage,te923tool))
