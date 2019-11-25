include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = JellyfishCustom
JellyfishCustom_FILES = JFCRootListController.m
JellyfishCustom_INSTALL_PATH = /Library/PreferenceBundles
JellyfishCustom_FRAMEWORKS = UIKit
JellyfishCustom_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/JellyfishCustom.plist$(ECHO_END)
