# Compiler
CC = ozc

# Compiler flags
CFLAGS = --warnopt --warnunusedformals

# Define sources
FILES = $(shell find -name "*.oz")

# Define objects
OBJ = $(FILES:.oz=.ozf)

all: $(OBJ)

# Compile
%.ozf: %.oz
	$(CC) $(CFLAGS) -c $< -o $@

# Clean
clean:
	rm -f *.ozf
