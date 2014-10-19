DESTDIR?=
PREFIX?=/usr
DP=${DESTDIR}/${PREFIX}

all:
	@cd tests ; $(MAKE)

clean:
	rm -f *.o *.c main test

install:
	mkdir -p ${DP}/bin
	cp -f posixvalac ${DP}/bin
	sed -i -e "s,^POSIXVALADIR=include,POSIXVALADIR=${PREFIX}/include/posixvala," \
		 ${DP}/bin/posixvalac
	chmod +x ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	mkdir -p ${DP}/include/posixvala
	cp -rf include/posixvala/* ${DP}/include/posixvala
	sed -e "s,^prefix=/usr/local,prefix=${PREFIX}," \
		< pkgconfig/posixvala.pc \
		 > ${DP}/lib/pkgconfig/posixvala.pc

uninstall deinstall:
	rm -f ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	rm -f ${DP}/lib/pkgconfig/posixvala.pc

symstall:
	mkdir -p ${DP}/bin ${DP}/include
	ln -fs `pwd`/posixvalac ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	ln -fs `pwd`/include/posixvala ${DP}/include/posixvala
	cp -f pkgconfig/posixvala.pc ${DP}/lib/pkgconfig
	sed -i -e "s,/usr/local,${PREFIX}," ${DP}/lib/pkgconfig/posixvala.pc
