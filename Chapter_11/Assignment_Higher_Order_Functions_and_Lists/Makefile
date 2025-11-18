TARGET = build/app

CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -Iheaders


SRC = $(wildcard src/*.c)

OBJ = $(patsubst src/%.c, build/%.o, $(SRC))

all:$(TARGET)


$(TARGET):$(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

build/%.o:src/%.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build