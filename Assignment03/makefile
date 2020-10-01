# Compiler
CC = ozc

# Compiler flags
CFLAGS = --warnopt

# Define sources
FILES = $(shell find -maxdepth 1 -name "*.oz")

# Define objects
OBJ = main.ozf

all: $(OBJ)

# Compile
%.ozf: %.oz
	$(CC) $(CFLAGS) -c $< -o $@

# Clean
clean:
	rm -f *.ozf
