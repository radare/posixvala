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
	public int innerHTML(string id, string arg) {
		Emscripten.INT("window.g={ps:Pointer_stringify}", 0);
		Emscripten.INT("window.g.gei=function(x){return document.getElementById(x);}", 0);
		return Emscripten.INT ("window.g.gei(window.g.ps($0)).innerHTML+=window.g.ps($1);", (int)id, arg);
	}

	public void alert(string msg) {
		Emscripten.INT ("alert(Pointer_stringify($0));",(int)msg);
	}

	public void addEventListener(string ev, Callback cb) {
		Emscripten.INT("window.mycb = Runtime.getFuncWrapper($0,'vi')(0);", (int)cb);
		Emscripten.INT("document.addEventListener(Pointer_stringify($0), window.mycb);", (int)ev);
	}

	public static void onDOMContentLoaded(Callback cb) {
		//alert ("%d".printf ((int)cb));
		Emscripten.INT("window.mycb = Runtime.getFuncWrapper($0,'vi')(0);", (int)cb);
		Emscripten.INT("document.addEventListener('DOMContentLoaded', window.mycb);", 0);
	}
}
