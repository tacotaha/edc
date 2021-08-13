CC=gcc
CFLAGS=-Wall -Werror -std=c99 -pedantic -g
OBJ=opcodes.o
EXEC=test edc

edc: main.o $(OBJ)
	$(CC) main.o $(OBJ) -o edc 

test: test.o $(OBJ)
	$(CC) test.o $(OBJ) -o test

main.o: Main.c
	$(CC) $(CFLAGS) -c Main.c -o main.o

test.o: test.c
	$(CC) $(CFLAGS) -c test.c -o test.o

opcodes.o: Opcodes.h Opcodes.c
	$(CC) $(CFLAGS) -c Opcodes.c -o opcodes.o

clean:
	rm -f $(EXEC) *.o *~

format:
	find . -name "*.c" | xargs indent -par -br -brf -brs -kr -ci2 -cli2 -i2 -l80 -nut
	find . -name "*.h" | xargs indent -par -br -brf -brs -kr -ci2 -cli2 -i2 -l80 -nut
