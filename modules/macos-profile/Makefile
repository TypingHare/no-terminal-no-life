.PHONY: build clean

SRC_DIRPATH := src
TARGET_DIRPATH := build
TARGET_FILEPATH := $(TARGET_DIRPATH)/profile.zsh

build:
	@echo "Creating the target directory: $(TARGET_DIRPATH)"
	@mkdir -p $(TARGET_DIRPATH)
	@echo "Building combined Zsh profile..."
	@find $(SRC_DIRPATH) -type f -name '*.zsh' -exec cat {} + \
		> $(TARGET_FILEPATH)
	@echo "Build completed: $(TARGET_FILEPATH)"

clean:
	rm -rf $(TARGET_DIRPATH)
