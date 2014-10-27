PVALA=../posixvalac
VAPIDIR=../vapi
EMCC=emcc

all: main test test2

main: main.vala
	$(PVALA) --save-temps main.vala

test: test.gs
	$(PVALA) --save-temps test.gs

test2: test2.vala
	$(PVALA) --save-temps test2.vala

test.js:
	$(PVALA) --emcc test.gs
	#$(PVALA) -C test.gs
	#$(EMCC) `pkg-config posixvala --cflags` -o test.js test.c

test-emcc.js:
	$(PVALA) --emcc --vapidir=$(VAPIDIR) --pkg emscripten test-emcc.vala
	#valac -C --vapidir=$(VAPIDIR) test-emcc.vala --pkg emscripten
	#emcc -o test-emcc.js test-emcc.c `pkg-config --cflags posixvala`

js: test.js test-emcc.js


.PHONY: test.js test-emcc.js

clean:
	rm -f main main.c main.o
	rm -f test test.c test.o
	rm -f test2 test2.c test2.o
	rm -f test.js
