#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

#######################################################################
# Master "Core Components" macros to figure out binary code location  #
#######################################################################

#
# Figure out where the binary code lives.
#

ifdef BUILD_TREE
ifdef LIBRARY_NAME
BUILD         = $(BUILD_TREE)/nss/$(LIBRARY_NAME)
OBJDIR        = $(BUILD_TREE)/nss/$(LIBRARY_NAME)
DEPENDENCIES  = $(BUILD_TREE)/nss/$(LIBRARY_NAME)/.md
else
BUILD         = $(BUILD_TREE)/nss
OBJDIR        = $(BUILD_TREE)/nss
DEPENDENCIES  = $(BUILD_TREE)/nss/.md
endif
else
BUILD         = $(PLATFORM)
OBJDIR        = $(PLATFORM)
DEPENDENCIES  = $(PLATFORM)/.md
endif

DIST          = $(BUILD_TREE)/$(PLATFORM)

ifdef BUILD_DEBUG_GC
    DEFINES += -DDEBUG_GC
endif

GARBAGE += $(DEPENDENCIES) core $(wildcard core.[0-9]*)

INCLUDES += -I$(SOURCE_PREFIX)/../nspr/lib/ds -I$(SOURCE_PREFIX)/../nspr/pr/include -I$(BUILD_TREE)/../nspr/dist/include/nspr

ifndef NSPR_LIB_DIR
    NSPR_LIB_DIR = $(DIST)/lib
endif

ifdef NSS_INCLUDE_DIR
    INCLUDES += -I$(NSS_INCLUDE_DIR)
endif

ifndef NSS_LIB_DIR
    NSS_LIB_DIR = $(DIST)/lib
endif

ifdef NSSUTIL_INCLUDE_DIR
    INCLUDES += -I$(NSSUTIL_INCLUDE_DIR)
endif

ifndef NSSUTIL_LIB_DIR
    NSSUTIL_LIB_DIR = $(DIST)/lib
endif

ifdef SOFTOKEN_INCLUDE_DIR
    INCLUDES += -I$(SOFTOKEN_INCLUDE_DIR)
endif

ifndef SOFTOKEN_LIB_DIR
    SOFTOKEN_LIB_DIR = $(DIST)/lib
endif

ifndef SQLITE_LIB_NAME
    SQLITE_LIB_NAME = sqlite3
endif

MK_LOCATION = included
