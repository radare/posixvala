/* Hello World HTML5/PosixVala/Emscripten app */

using Web;

static void createHomepage() {
	//var body = Web.getElementById ("vala");
	Web.innerHTML ("vala", "<h1>It works!</h1>");
	Web.alert("callback");
	Web.localStorage ("hello","world");
	alert (Web.localStorage ("hello"));
	alert("Hello "+prompt("Name?"));
}

void main() {
/*
	// still work-in-progress //
	var r2p = new R2Pipe ("http://cloud.radare.org/");
	r2p.cmd ("pd 4", (x)=> {
		Web.alert (x);
	});
*/
//	Web.alert ("init");
	Web.onDOMContentLoaded(() => {
//		Web.alert ("loaded 1");
	});
	Web.addEventListener("DOMContentLoaded", () => {
//		Web.alert ("loaded 2");
		createHomepage();
	});

	MozWeb.vibrate (1000);
}
