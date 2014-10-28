[Compact]
public class PropertyDemo {
	public string _name = "ItsMe";
	public string name {
		get {
			stdout.printf ("It works!\n");
			return _name;
		}
		set { 
			stdout.printf ("It works!\n");
			_name = value;
		}
	}
}

void main() {
	var p = new PropertyDemo ();
	stdout.printf ("--> %s\n", p.name);
	p.name = "test";
	stdout.printf ("--> %s\n", p.name);
}
