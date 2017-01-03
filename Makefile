DESTDIR?=
PREFIX?=/usr
VAPIDIR=share/vala/vapi
PKGCONFIGDIR=lib/pkgconfig
DP=${DESTDIR}/${PREFIX}
PWD=$(shell pwd)

all:
	@cd tests ; $(MAKE)

clean:
	rm -f *.o *.c main test

install:
	mkdir -p ${DP}/bin
	sed "s,^POSIXVALADIR=include,POSIXVALADIR=${PREFIX}/include/posixvala," \
		 < posixvalac > ${DP}/bin/posixvalac
	chmod +x ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	mkdir -p ${DP}/include/posixvala
	mkdir -p ${DP}/${VAPIDIR}
	mkdir -p ${DP}/${PKGCONFIGDIR}
	cp -f vapi/emscripten.vapi ${DP}/${VAPIDIR}/emscripten.vapi
	cp -rf include/posixvala/* ${DP}/include/posixvala
	sed "s,^prefix=/usr/local,prefix=${PREFIX}," \
		< pkgconfig/posixvala.pc > ${DP}/${PKGCONFIGDIR}/posixvala.pc

uninstall deinstall:
	rm -f ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	rm -f ${DP}/${PKGCONFIGDIR}/posixvala.pc
	rm -f ${DP}/${VAPIDIR}/emscripten.vapi

symstall:
	mkdir -p ${DP}/bin ${DP}/include
	ln -fs $(PWD)/posixvalac ${DP}/bin/posixvalac
	rm -rf ${DP}/include/posixvala
	ln -fs $(PWD)/include/posixvala ${DP}/include/posixvala
	ln -fs $(PWD)/vapi/emscripten.vapi ${DP}/${VAPIDIR}/emscripten.vapi
	sed "s,/usr/local,${PREFIX}," \
		< pkgconfig/posixvala.pc > ${DP}/${PKGCONFIGDIR}/posixvala.pc
