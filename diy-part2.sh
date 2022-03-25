#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.103/g' package/base-files/files/bin/config_generate
# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-Adao'' package/lean/default-settings/files/zzz-default-settings
# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /A build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
# aliyundrive-webdav
git clone https://github.com/messense/aliyundrive-webdav.git package/aliyundrive-webdav
# OpenClash
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# openwrt-bypass
git clone https://github.com/kiddin9/openwrt-bypass.git package/openwrt-bypass
# openwrt-overwall
git clone https://github.com/small-5/Openwrt-Compile.git package/overwall
