VALAFILES=web.vala index.vala r2pipe.vala

all:
	#posixvalac --emcc --save-temps --Xcc=-O0 $(VALAFILES) --pkg emscripten
	posixvalac --emcc --save-temps $(VALAFILES) --pkg emscripten
