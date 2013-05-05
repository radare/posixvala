DESTDIR?=
PREFIX?=/usr
DP=${DESTDIR}/${PREFIX}

all: main test

main: main.vala
	./posixvala --save-temps main.vala

test: test.gs
	./posixvala --save-temps test.gs

dist: clean
	cd .. ; tar czvf posixvala.tar.gz posixvala

clean:
	rm -f *.o *.c main test

install:
	mkdir -p ${DP}/bin
	cp -f posixvala ${DP}/bin
	sed -i -e "s,^POSIXVALADIR=include,POSIXVALADIR=${PREFIX}/include/posixvala," \
		 ${DP}/bin/posixvala
	chmod +x ${DP}/bin/posixvala
	rm -rf ${DP}/include/posixvala
	mkdir -p ${DP}/include/posixvala
	cp -rf include/* ${DP}/include/posixvala

#symstall:
