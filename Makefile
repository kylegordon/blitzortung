include $(TOPDIR)/rules.mk

PKG_NAME:=blitzortung
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/blitzortung-$(PKG_VERSION)
PKG_SOURCE:=blitzortung-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Elwell/blitzortung.git
PKG_SOURCE_PROTO:=git
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/blitzortung
  SECTION:=utils
  CATEGORY:=Utilities
  DEFAULT:=n
  TITLE:=Blitzortung lightning tracker utility
  URL:=https://github.com/Elwell/blitzortung/
endef

define Package/bridge/description
 Blitzortung lightning tracker utility
endef

define Build/Configure
  $(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

define Package/bridge/install
        $(INSTALL_DIR) $(1)/usr/sbin
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/tracker_Linux $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,bridge))
