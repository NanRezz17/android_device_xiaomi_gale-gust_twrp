#
# Copyright 2026 TeamWin
# This file is part of TWRP/TeamWin Recovery Project.
#
# TWRP is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# TWRP is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with TWRP.  If not, see <http://www.gnu.org/licenses/>.
#

DEVICE_PATH := device/xiaomi/gust

# Inherit call
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Product device specification
PRODUCT_DEVICE := gust
PRODUCT_NAME := twrp_gust
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 23108RN04Y
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_RELEASE_NAME := Poco C65