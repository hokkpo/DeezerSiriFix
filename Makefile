TARGET := iphone:clang:latest:14.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DeezerSiriFix

DeezerSiriFix_FILES = Tweak.x
DeezerSiriFix_CFLAGS = -fobjc-arc
DeezerSiriFix_FRAMEWORKS = Intents

include $(THEOS_MAKE_PATH)/tweak.mk
