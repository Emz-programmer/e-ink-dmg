TARGET = eInkDmg
CC = gcc
CFLAGS = -g -o -ffunction-sections -fdate-sections -Wall

SRC_DIR = src
OBJ_DIR = build

SRCS = $(shell find $(SRC_DIR) -name '*.c')
OBJS = $(pathsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.C
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) $(TARGET)