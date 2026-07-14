# SPDX-License-Identifier: 0BSD
# SPDX-FileCopyrightText: 2026 lifehackerhansol

AKLOADER_DIR	?= $(CURDIR)
AKLOADER_OUT	?= $(AKLOADER_DIR)/out

AKLOADER_SRC	:=	$(shell find $(AKLOADER_DIR)/$(CONFIG_AKLOADER_PLATFORM) -type f)

AKLOADER_DST :=	$(patsubst $(AKLOADER_DIR)/$(CONFIG_AKLOADER_PLATFORM)/%,$(AKLOADER_OUT)/%,$(AKLOADER_SRC))

.PHONY:	akloader

akloader: $(AKLOADER_DST)

$(AKLOADER_OUT)/%: $(AKLOADER_DIR)/$(CONFIG_AKLOADER_PLATFORM)/%
	@echo "  CP    $<"
	@mkdir -p $(dir $@)
	@cp -R $< $@
