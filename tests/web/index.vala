/* Hello World HTML5/PosixVala/Emscripten app */

using Web;

static void createHomepage() {
	//var body = Web.getElementById ("vala");
	Web.innerHTML ("vala", "<h1>It works!</h1>");
}

void main() {
//	Web.alert ("init");
	Web.onDOMContentLoaded(() => {
//		Web.alert ("loaded 1");
	});
	Web.addEventListener("DOMContentLoaded", () => {
//		Web.alert ("loaded 2");
		createHomepage();
	});
}
