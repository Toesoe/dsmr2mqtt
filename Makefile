include $(TOPDIR)/rules.mk

PKG_NAME:=dsmr2mqtt
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/dsmr2mqtt-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Toesoe/dsmr2mqtt.git
PKG_MIRROR_HASH:=1705c0bbb8fc7c2509e414ddbb06ec6604993fd95e523678673b8d7292b34369
PKG_SOURCE_VERSION:=8ec2e5843a12e2a26da0888cb80e21ba7f157e5b
PKG_SOURCE_DATE:=2025-08-10
PKG_HASH:=

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
