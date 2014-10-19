PVALA=../posixvalac

all: main test

main: main.vala
	$(PVALA) --save-temps main.vala

test: test.gs
	$(PVALA) --save-temps test.gs

clean:
	rm -f main main.c main.o
	rm -f test test.c test.o
