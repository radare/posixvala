using Emscripten;

[Compact]
public class R2Pipe {
	public delegate void Callback(string res);

	public string url;

	public R2Pipe(string url) {
		this.url = url;
	}

	public bool cmd(string cmd, Callback cb) {
		Emscripten.INT("""
try {
			var r = new XMLHttpRequest ();
			r.onload = function(e) {
				alert (e.response);
			};
			r.open ('GET', Pointer_stringify ($0)+'/cmd/'+Pointer_stringify ($1), true);
			r.send ();
} catch (e) {
alert (e);
}
		""",
			(int)url, (int)cmd, (int)cb);
		return true;
	}
}
