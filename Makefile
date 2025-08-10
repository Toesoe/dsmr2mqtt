include $(TOPDIR)/rules.mk

PKG_NAME:=dsmr2mqtt
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Toesoe/dsmr2mqtt.git
PKG_SOURCE_VERSION:=6d4f550cd883f9f652d96e4d73d20c5aaa988b0d
PKG_MIRROR_HASH:=skip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dsmr2mqtt
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=DSMR to MQTT utility
  DEPENDS:=+libmosquitto
endef

define Package/dsmr2mqtt/description
 DSMR to MQTT utility
 Connect a DSMR smart meter to the USB of your
 OpenWrt device and to a MQTT broker to pass
 on all the telegrams.
endef

define Package/dsmr2mqtt/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dsmr2mqtt $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dsmr2mqtt))
