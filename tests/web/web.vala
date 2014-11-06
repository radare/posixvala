using Emscripten;

namespace Web {
	public delegate void Callback();

	public int getElementById(string name_id) {
		return Emscripten.INT ("return document.getElementById(Pointer_stringify($0))", (int)name_id);
	}
/*
	int innerHTML(int id, string arg) {
		return Emscripten.INT ("$0.innerHTML += Pointer_stringify($1);", id, arg);
	}
	int innerHTML(int id, string arg) {
		Emscripten.INT("window.g={ps:Pointer_stringify}", 0);
		Emscripten.INT("window.g.gei=function(x){return document.getElementById(x);}", 0);
		return Emscripten.INT ("window.g.gei(window.g.ps($0)).innerHTML+=window.g.ps($1);", (int)id, arg);
	}
*/
	public string? localStorage(string key, string? val = null) {
		if (val != null) {
			Emscripten.INT("""
			localStorage[Pointer_stringify($0)] = Pointer_stringify ($1);
			""",
			(int)key, (int)val);
			return null;
		} else {
			var ret = Emscripten.INT("""
			var str = localStorage[Pointer_stringify($0)];
			if (!str) return "XXX";
			var memoryArea = _malloc(str.length+1);
                        writeStringToMemory(str, memoryArea);
			return memoryArea;
			""",
			(int)key);
			return (string)(void*)ret;
		}
	}

	public int innerHTML(string id, string arg) {
		Emscripten.INT("window.g={ps:Pointer_stringify}", 0);
		Emscripten.INT("window.g.gei=function(x){return document.getElementById(x);}", 0);
		return Emscripten.INT ("window.g.gei(window.g.ps($0)).innerHTML+=window.g.ps($1);", (int)id, arg);
	}

	public void alert(string msg) {
		Emscripten.INT ("alert(Pointer_stringify($0));",(int)msg);
	}

	public string prompt(string msg, string? text = null) {
		if (text != null) {
			return (string)(void*)
			Emscripten.INT ("""
				var str = prompt(Pointer_stringify($0),Pointer_stringify($1));
				if (!str) return "XXX";
				var memoryArea = _malloc(str.length+1);
				writeStringToMemory(str, memoryArea);
				return memoryArea;
			""",
				(int)msg, (int)text);
			Emscripten.INT ("prompt(Pointer_stringify($0),Pointer_stringify($1));",(int)msg, (int)text);
		} else {
			return (string)(void*)
			Emscripten.INT ("""
				var str = prompt (Pointer_stringify($0));
				if (!str) return "XXX";
				var memoryArea = _malloc(str.length+1);
				writeStringToMemory(str, memoryArea);
				return memoryArea;
			""",
				(int)msg);
		}
	}

	public static void addEventListener(string ev, Callback cb) {
		Emscripten.INT("""
			document.addEventListener(Pointer_stringify($0), 
				Runtime.getFuncWrapper($1,'vi') );
			""",
			(int)ev, (int)cb);
	}

	public static void onDOMContentLoaded(Callback cb) {
		//alert ("%d".printf ((int)cb));
#if USE_SHORT_METHOD
		Emscripten.INT("window.mycb = Runtime.getFuncWrapper($0,'vi')(0);", (int)cb);
		Emscripten.INT("document.addEventListener('DOMContentLoaded', window.mycb);", 0);
#else
		addEventListener("DOMContentLoaded", cb);
#endif
	}

	public static void vibrate(int msecs) {
		Emscripten.INT("""
			navigator.vibrate = navigator.vibrate
				|| navigator.webkitVibrate
				|| navigator.mozVibrate
				|| navigator.msVibrate;
			navigator.vibrate($0);
		""", msecs);
	}

	// TODO: Implement
	public static void vibratePattern(int[] msecs) {
		// TODO
	}
}
