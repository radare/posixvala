NAME		:= posixvala

PREFIX		:= /usr/local
BINDIR		:= $(PREFIX)/bin
INCLUDEDIR	:= $(PREFIX)/include

PKGS		:= glib-2.0 gobject-2.0 libvala-0.22

VALAC		:= valac

DESTDIR		:=

PVALA		:= $(NAME)c
PVALA_RUNNER	:= $(NAME)
PVALA_SRC	+= $(wildcard src/*.vala)
PVALA_C_SRC	+= $(patsubst %.vala,%.c,$(PVALA_SRC))
PVALA_OBJ	+= $(patsubst %.c,%.o,$(PVALA_C_SRC))

TESTS		+= $(wildcard tests/*.vala) $(wildcard tests/*.gs)

PKGC		+= $(shell pkg-config --cflags $(PKGS))
PKGL		+= $(shell pkg-config --libs $(PKGS))

CFLAGS		+= $(PKGC) -w -O2 -pipe -fPIC -I.
LDFLAGS		+= $(PKGL)

VPKG		+= $(patsubst %,--pkg=%,$(PKGS))
VFLAGS		+= --nostdpkg $(VPKG)
VFLAGS		+= --target-glib=2.38

all: $(PVALA_RUNNER)

$(PVALA_RUNNER): $(PVALA)
	@ln -svf $< $@

$(PVALA): $(PVALA_OBJ)
	@echo "[CCLD]	$@"
	@$(CC) -o $@ $(PVALA_OBJ) $(LDFLAGS)

%.o: %.c
	@echo "[CC]	$@"
	@$(CC) -o $@ -c $< $(CFLAGS)

pvala.stamp: $(PVALA_SRC)
	@echo "Generating source for target: $(PVALA) ..."
	@valac $(VFLAGS) -C $(PVALA_SRC)
	@touch $@

$(PVALA_C_SRC): pvala.stamp

tests: $(PVALA_RUNNER)
	@for t in $(notdir $(TESTS)); do 				\
		./$(PVALA) --save-temps --Xcc='-Iinclude' tests/$$t	\
			-o tests/$${t%.*};				\
		tests/$${t%.*};						\
	done

install: all
	@mkdir -pv $(DESTDIR)$(BINDIR) $(DESTDIR)$(INCLUDEDIR)
	@install -v -m0755 $(PVALA) $(DESTDIR)$(BINDIR)
	@cd $(DESTDIR)$(BINDIR) && ln -svf $(PVALA) $(PVALA_RUNNER)
	@cp -av include/posixvala $(DESTDIR)$(INCLUDEDIR)


uninstall:
	@rm -fv $(DESTDIR)$(BINDIR)/$(PVALA)
	@rm -fv $(DESTDIR)$(BINDIR)/$(PVALA_RUNNER)
	@rm -rvf $(DESTDIR)$(INCLUDEDIR)/posixvala

clean:
	@rm -fv $(PVALA) $(PVALA_RUNNER) $(PVALA_C_SRC) $(PVALA_OBJ)	\
		pvala.stamp tests/*.c
	@for t in $(notdir $(TESTS)); do				\
		rm -fv tests/$${t%.*};					\
	done

.PHONY: all tests install uninstall clean
.PRECIOUS: $(PVALA_SRC) $(PVALA_C_SRC)
