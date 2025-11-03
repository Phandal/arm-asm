all: mov

mov: mov.o
	ld -o mov mov.o

mov.o: mov.s
	as -o mov.o mov.s

.PHONY: clean

clean:
	rm -rf mov.o mov

