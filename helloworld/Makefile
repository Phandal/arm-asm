all: hello

hello: hello.o
	ld -o hello hello.o

hello.o: hello.s
	as -o hello.o hello.s

.PHONY: clean

clean:
	rm -rf hello.o hello

