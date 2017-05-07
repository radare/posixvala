using Linux;

int main () {
	var epfd = epoll_create1 ();
	epoll_ctl (epfd, EPOLL_CTL_ADD, stdout.fileno (), EpollEvent () { events = EPOLLOUT });

	var events = new EpollEvent[1];
	var emitted = epoll_wait (epfd, events, 1);

	if (emitted == 1) {
		Posix.stdout.printf ("Hello world!\n");
		return 0;
	} else {
		return 1;
	}
}
