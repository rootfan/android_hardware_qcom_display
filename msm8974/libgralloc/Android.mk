# Copyright (C) 2008 The Android Open Source Project
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

# Gralloc module
LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

# gralloc.cpp:87  use of GNU old-style field designator extension.
LOCAL_CLANG_CFLAGS            += -Wno-gnu-designator

LOCAL_MODULE                  := gralloc.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_PROPRIETARY_MODULE      := true
LOCAL_MODULE_TAGS             := optional
LOCAL_SHARED_LIBRARIES        := $(common_libs) libmemalloc
LOCAL_SHARED_LIBRARIES        += libqdutils libGLESv1_CM
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdgralloc\"
LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers
LOCAL_SRC_FILES               := gpu.cpp gralloc.cpp framebuffer.cpp mapper.cpp

include $(BUILD_SHARED_LIBRARY)

# MemAlloc Library
include $(CLEAR_VARS)

LOCAL_MODULE                  := libmemalloc
LOCAL_PROPRIETARY_MODULE      := true
LOCAL_MODULE_TAGS             := optional
LOCAL_SHARED_LIBRARIES        := $(common_libs) libqdutils libdl
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdmemalloc\"
LOCAL_HEADER_LIBRARIES        := display_headers generated_kernel_headers
LOCAL_SRC_FILES               := ionalloc.cpp alloc_controller.cpp

include $(BUILD_SHARED_LIBRARY)
