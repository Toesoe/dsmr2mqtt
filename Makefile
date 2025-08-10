include $(TOPDIR)/rules.mk

PKG_NAME:=dsmr2mqtt
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Toesoe/dsmr2mqtt.git
PKG_SOURCE_VERSION:=6208feba937e15d37d34a8c1f23f024c1e8fb05a
PKG_MIRROR_HASH:=skip

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
 OpenWRT device and to a MQTT broker to pass 
 on all the telegrams.
endef


define Package/dsmr2mqtt/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dsmr2mqtt $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dsmr2mqtt))
