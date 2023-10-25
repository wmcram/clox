CC := gcc
CFLAGS := -std=c99 -I./src
LDFLAGS :=
SRC_DIR := src
BUILD_DIR := build
TARGET := your_program

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
DEPS := $(wildcard $(SRC_DIR)/*.h)

.PHONY: all clean run

all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

run: all
	@./$(BUILD_DIR)/$(TARGET)
