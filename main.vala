
errordomain MyError {
    HAS_FAILED
}

[Compact]
public class Oops {
	public int counter;

	public Oops() {
		print ("new oops\n");
		this.counter = 0;
	}

	public void fail() throws Error {
		throw new MyError.HAS_FAILED ("calling fail()");
//		throw new Error(1,1,"pop");
	}

	public void inc() {
		print ("INC %d\n", this.counter);
		this.counter++;
	}

	public string to_string() {
		return "Oops: %d".printf (this.counter);
	}
}

struct Person {
	string name;
	int age;
	public Person(string n) {
		this.name = n;
		this.age = 42;
	}
}

void main() {
	var str = "Hello World\n";
	print (str);

	var p = Person ("Alice");
	p.age = 42;
	GLib.stdout.printf ("  Name: %s\n  Age: %d\n",
		p.name, p.age);

	var f = 2.14;
	print ("%f\n", f+1);

	for (var i =0 ; i<3; i++)
		print ("Count %d\n", i);

	var obj = new Oops();
	try {
		obj.fail();
	} catch (Error e) {
		print ("ERROR FAIL HAS THROWNED EXCEPTICON\n");
		print ("message: "+e.message+"\n");
	}
	obj.inc();
	obj.inc();
	obj.inc();
	print ("Obj = %s\n", obj.to_string ());
	
	obj = null;

	// experimental syntax
	// if (10 < p.age > 30) { print ("Isok\n"); }

	int[] a = new int[10];
	for (var i=0;i<a.length; i++)
		a[i]= i;
	for (var i=0;i<a.length; i++)
		GLib.stderr.printf ("--> %d %d\n", i, a[i]);

	var s = new List<string>();
	s.append ("pop");
	s.append ("jojo");
	s.append ("lalla");
	s.prepend ("FIRST");

	foreach (var z in s) {
		print ("strings : "+z+"\n");
	}

	test_slist ();
}

void test_slist () {
	var s = new SList<string>();
	s.append ("pop");
	s.append ("jojo");
	s.append ("lalla");
	s.prepend ("FIRST");

	foreach (var z in s) {
		print ("strings : "+z+"\n");
	}
}
