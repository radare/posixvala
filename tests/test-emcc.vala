using Emscripten;

[Compact]
class Tests {
	private static void log (string msg) {
		stdout.printf ("\x1b[32m%s\x1b[0m\n", msg);
	}
	public Tests () {
		log ("Calling Javascript code from Vala:");
	}
	void test1 () {
		log ("Javascript code from Vala:");
		Emscripten.BLOCK_START ();
		Emscripten.eval ("""
			console.log ("Hello World\n");
		""");
		Emscripten.BLOCK_END ();
	}
	void test2 (int num) {
		log ("Passing integers from Vala to JS:");
		Emscripten.INT("console.log($0)", num);
	}
	void test3 (string msg) {
		log ("Passing strings from Vala to JS:");
		Emscripten.INT("console.log('Hello', Pointer_stringify($0))", (int)msg);
	}
	void test4 () {
		log ("Getting JS result from Vala");
		var a = Emscripten.INT("return 42",0);
		stdout.printf ("Result = %d\n", a);
	}
	public void run() {
		test1 ();
		test2 (23);
		test3 ("World");
		test4 ();
	}
}


void main() {

	new Tests ().run ();
}
