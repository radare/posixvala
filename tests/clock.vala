using Posix;

static void showtime() {
	Posix.timeval tv = {0};
	tv.get_time_of_day ();
	printf ("SEC %d\n", (int)tv.tv_sec);
	printf ("USEC %d\n", (int)tv.tv_usec);
}

void main() {
	showtime ();
	var a = 3351;
	for (var i = 0;i<1024*1024; i++) {
		a ^= i;
	}
	printf("%d\n", a);
	showtime ();
}
