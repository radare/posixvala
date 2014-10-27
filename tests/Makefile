PVALA=../posixvalac
EMCC=emcc

all: main test test2

main: main.vala
	$(PVALA) --save-temps main.vala

test: test.gs
	$(PVALA) --save-temps test.gs

test2: test2.vala
	$(PVALA) --save-temps test2.vala

test.js:
	$(PVALA) -C test.gs
	$(EMCC) `pkg-config posixvala --cflags` -o test.js test.c

clean:
	rm -f main main.c main.o
	rm -f test test.c test.o
	rm -f test2 test2.c test2.o
	rm -f test.js
