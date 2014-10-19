DESTDIR?=
PREFIX?=/usr
DP=${DESTDIR}/${PREFIX}

all:
	@cd tests ; $(MAKE)

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
	cp -f posixvala.pc ${DP}/lib/pkgconfig
	sed -i -e "s,^prefix=/usr/local,prefix=${PREFIX}," \
		 ${DP}/lib/pkgconfig/posixvala.pc

uninstall deinstall:
	rm -rf ${DP}/bin/posixvala
	rm -rf ${DP}/include/posixvala

symstall:
	mkdir -p ${DP}/bin ${DP}/include
	ln -fs `pwd`/posixvala ${DP}/bin/posixvala
	rm -rf ${DP}/include/posixvala
	ln -fs `pwd`/include ${DP}/include/posixvala
