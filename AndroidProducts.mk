#
# Copyright (C) 2026 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_MAKEFILES := $(LOCAL_DIR)/twrp_gale.mk

# NOTICE: You need to Input Valid combos in the form (Adjust based on your AOSP Source Build Release)
# Valid Combos <product>-<release>-<variant>
# Example (For AP2A base): twrp_gale-ap2a-eng

COMMON_LUNCH_CHOICES := \
    twrp_gale-user \
    twrp_gale-userdebug \
    twrp_gale-eng