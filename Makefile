CC = gcc

CFLAGS = -Wall -Werror -g

LDFLAGS = -lgpiod -lm

SRC_DIR = ./src
BUILD_DIR = ./build
CONFIG_DIR = $(SRC_DIR)/config
FONTS_DIR = $(CONFIG_DIR)/fonts
OBJ_DIR = $(BUILD_DIR)/obj
OBJ_CONFIG_DIR = $(OBJ_DIR)/config
OBJ_FONTS_DIR = $(OBJ_CONFIG_DIR)/fonts
BIN_DIR = $(BUILD_DIR)/bin

TARGET = $(BIN_DIR)/e-ink-dmg

SRC_FILES = $(wildcard $(SRC_DIR)/*.c) $(wildcard $(CONFIG_DIR)/*.c) $(wildcard $(FONTS_DIR)/*.c)

OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))
OBJ_FILES := $(patsubst $(CONFIG_DIR)/%.c, $(OBJ_CONFIG_DIR)/%.o, $(OBJ_FILES))
OBJ_FILES := $(patsubst $(FONTS_DIR)/%.c, $(OBJ_FONTS_DIR)/%.o, $(OBJ_FILES))

all: $(TARGET)

$(TARGET): $(OBJ_FILES) | $(BIN_DIR)
	$(CC) $(CFLAGS) $(OBJ_FILES) $(LDFLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_CONFIG_DIR)/%.o: $(CONFIG_DIR)/%.c | $(OBJ_CONFIG_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_FONTS_DIR)/%.o: $(FONTS_DIR)/%.c | $(OBJ_FONTS_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_CONFIG_DIR):
	mkdir -p $(OBJ_CONFIG_DIR)

$(OBJ_FONTS_DIR):
	mkdir -p $(OBJ_FONTS_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
