# Project name
TARGET = blackjack

# Compiler and flags
CC = gcc
CFLAGS = -Wall -std=c99 -O2 -Iinclude

# Raylib and other libraries (installed via pacman)
LIBS = -lraylib -lm -ldl -lpthread -lGL -lrt -lX11

# Source files and output
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)

# Output directory
BIN = bin

# Default target
all: $(BIN)/$(TARGET)

# Linking
$(BIN)/$(TARGET): $(OBJ) | $(BIN)
	$(CC) $(OBJ) -o $@ $(LIBS)

# Compile source files
src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Create output directory
$(BIN):
	mkdir -p $(BIN)

# Clean up build artifacts
clean:
	rm -f src/*.o $(BIN)/$(TARGET)

.PHONY: all clean
