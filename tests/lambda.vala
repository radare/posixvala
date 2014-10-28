public delegate int Method(int foo);

public static int foo(Method q) {
	return q(33);
}

[Compact]
public class Lambda {
	public Lambda () {
	}

	public int do_it() {
		foo ((x)=> {
			stdout.printf ("Hello World %d\n", x);
			return 0;
		});
		return 0;
	}
}

void main(string[] args) {
	if (args.length>1) {
		int a = args[1].length;
		if (1<a<10) {
			new Lambda ().do_it ();;
		} else {
			stdout.printf ("Gimme other lengths\n");
		}
	}
}
