using Emscripten;
using Web;

static void createHomepage() {
	var body = Web.getElementById ("vala");
	Web.innerHTML (body, "It works!");
}

void main() {
	Web.alert ("init");
	Web.onDOMContentLoaded(() => {
		Web.alert ("loaded");
	});
	createHomepage();
}
