#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sed -i '1i src-git liuran001 https://github.com/liuran001/openwrt-packages' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 修改feeds以解决在 Ubuntu 22.04 上出现的报错问题
patch -p0 < files/feeds_patch.patch

# 修改target/linux/mediatek/patches-5.10/700-net-ethernet-mtk_eth_soc-add-support-for-coherent-DM.patch尝试修复ERROR: target/linux failed to build
patch -p0 < files/700-net-ethernet-mtk_eth_soc-add-support-for-coherent-DM.patch.diff 
