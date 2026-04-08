define KernelPackage/mediatek_hnat
  SUBMENU:=Network Devices
  TITLE:=Mediatek HNAT module
  DEPENDS:=@TARGET_mediatek +kmod-nf-conntrack
  AUTOLOAD:=$(call AutoLoad,20,mtkhnat)
  MODPARAMS.mtkhnat:=ppe_cnt=2
  KCONFIG:= \
	CONFIG_BRIDGE_NETFILTER=y \
	CONFIG_NETFILTER_FAMILY_BRIDGE=y \
	CONFIG_NET_MEDIATEK_HNAT
  FILES:= \
        $(LINUX_DIR)/drivers/net/ethernet/mediatek/mtk_hnat/mtkhnat.ko
endef

define KernelPackage/mediatek_hnat/description
  Kernel modules for MediaTek HW NAT offloading
endef

$(eval $(call KernelPackage,mediatek_hnat))

define KernelPackage/phy-air_en8811h
  SUBMENU:=Network Devices
  TITLE:=Airoha EN8811H PHY driver
  DEPENDS:=@TARGET_mediatek
  KCONFIG:= \
	CONFIG_AIROHA_EN8811H_PHY \
	CONFIG_AIROHA_EN8811H_PHY_DEBUGFS=y
  FILES:= \
	$(LINUX_DIR)/drivers/net/phy/air_en8811h.ko
  AUTOLOAD:=$(call AutoLoad,20,air_en8811h,1)
endef

define KernelPackage/phy-air_en8811h/description
  kernel modules for Airoha EN8811H PHY driver
endef

$(eval $(call KernelPackage,phy-air_en8811h))