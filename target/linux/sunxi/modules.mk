#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

define KernelPackage/rtc-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Sunxi SoC built-in RTC support
    DEPENDS:=@TARGET_sunxi
    $(call AddDepends/rtc)
    KCONFIG:= \
	CONFIG_RTC_CLASS=y \
	CONFIG_RTC_DRV_SUNXI=m
    FILES:=$(LINUX_DIR)/drivers/rtc/rtc-sunxi.ko
    AUTOLOAD:=$(call AutoLoad,50,rtc-sunxi)
endef

define KernelPackage/rtc-sunxi/description
 Support for the AllWinner sunXi SoC's onboard RTC
endef

$(eval $(call KernelPackage,rtc-sunxi))

define KernelPackage/eeprom-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=AllWinner Security ID fuse support
    DEPENDS:=@TARGET_sunxi
    KCONFIG:= \
	CONFIG_EEPROM_SUNXI_SID
    FILES:=$(LINUX_DIR)/drivers/misc/eeprom/sunxi_sid.ko
    AUTOLOAD:=$(call AutoLoad,50,sunxi_sid)
endef

define KernelPackage/eeprom-sunxi/description
 Support for the AllWinner Security ID fuse support
endef

$(eval $(call KernelPackage,eeprom-sunxi))

