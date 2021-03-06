APP_BASE_URL=http://localhost
DOCKER_COMPOSER_PN = devhub
DEVELOPER_HUB_CONTAINER = $(DOCKER_COMPOSER_PN)_developer-hub_1
PHPUNIT_CONTAINER  = $(DOCKER_COMPOSER_PN)_developer-hub_phpunit_1

BLUE   =\033[0;34m
GREEN  =\033[0;32m
END    =\033[0m
YELLOW =\033[0;33m

define nextStep
	@echo "$(YELLOW)NEXT STEP$(END) '$(BLUE)$(1)$(END)' $(2)";
endef

_confirm:
ifeq ($(strip $(NOINTERACTIVE)),1)
	@echo "NOINTERACTIVE defined. Assuming 'y'"
else
	@read -p "(y/n)" yn; \
	case $$yn in \
	[Yy]* ) break;; \
	* ) false;; \
	esac
endif
.PHONY: _confirm
