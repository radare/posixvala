namespace Project {
	[Compact]
	public class Model {
		public Model() {
			stdout.printf ("Model constructed\n");
		}
		public void test() {
			print ("Fuck yeah\n");
		}
	}
}

void main() {
	stdout.printf ("(%s)(%d)(%s)\n", Log.FILE, Log.LINE, Log.METHOD);
	stdout.printf ("Hello World\n");
	var x = new Project.Model ();
	x.test ();
}
