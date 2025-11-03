all: add_with_carry

add_with_carry: add_with_carry.o
	ld -o add_with_carry add_with_carry.o

add_with_carry.o: add_with_carry.s
	as -o add_with_carry.o add_with_carry.s

.PHONY: clean

clean:
	rm -rf add_with_carry.o add_with_carry

