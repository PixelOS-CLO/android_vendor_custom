CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

CUSTOM_PLATFORM_VERSION := 17.0

CUSTOM_VERSION := $(CUSTOM_BUILD)-$(CUSTOM_PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)
CUSTOM_VERSION_PROP := seventeen
CLO_SYSTEM_VERSION := $(shell grep -o 'refs/tags/LA\.QSSI[^"]*' manifest/default.xml | sed 's|refs/tags/||')

# PixelOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.system.version=$(CLO_SYSTEM_VERSION) \
    ro.custom.version=PixelOS_$(CUSTOM_VERSION) \
    net.pixelos.version=$(CUSTOM_VERSION_PROP)

# Updater
ifeq ($(IS_OFFICIAL),true)
    PRODUCT_PRODUCT_PROPERTIES += \
        net.pixelos.build_type=ci
endif
