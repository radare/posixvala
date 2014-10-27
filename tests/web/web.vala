namespace Web {
	int getElementById(string name_id) {
		return Emscripten.INT ("return document.getElementById(Pointer_stringify($0))", (int)name_id);
	}

	int innerHTML(int id, string arg) {
		return Emscripten.INT ("return $0.innerHTML += $1", id, arg);
	}

	void alert(string msg) {
		Emscripten.INT ("alert(Pointer_stringify($0));",(int)msg);
	}

	public delegate void Callback();

	public void addEventListener(string ev, Callback cb) {
		Emscripten.INT("document.addEventListener(Pointer.stringify($0), function() {invoke_callback($1);})", (int)ev, (int)cb);
	}

	// TODO: not yet working
	public static void onDOMContentLoaded(Callback cb) {
		//Emscripten.INT("document.addEventListener('DOMContentLoaded', function() {invoke_callback($0);})", (int)cb);
		alert ("%d".printf ((int)cb));
		//Emscripten.INT("Module['_'+$0]=function(){Module.ccall($0,'void',[],[]);}", (int)cb);
	//Emscripten.INT("Runtime.dynCall('v', $0);", (int)cb);
/*
	Emscripten.INT("""
//var stack = Runtime.stackSave();
Runtime.dynCall('v', onload, [$0, []]);
//Runtime.stackRestore(stack);
""", (int)cb);
*/
		//Emscripten.INT("Module.ccall(''+$0,'void',[],[$0]);", (int)cb, (int)cb);
	}
}
