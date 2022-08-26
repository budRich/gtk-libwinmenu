.PHONY: all install uninstall clean

NAME   := libwinmenu.so

LIBDIR       := /usr/lib64
gtk2_install := $(DESTDIR)$(LIBDIR)/gtk-2.0/modules/$(NAME)
gtk3_install := $(DESTDIR)$(LIBDIR)/gtk-3.0/modules/$(NAME)

all: gtk3.so gtk2.so

install: install-gtk3 install-gtk2
uninstall: uninstall-gtk3 uninstall-gtk2

clean:
	rm *.so

gtk3.so: libwinmenu.c
	$(CC) -DGTK3_BUILD -shared -fPIC `pkg-config gtk+-x11-3.0 --cflags --libs` -o $@ $<

gtk2.so: libwinmenu.c
	$(CC) -shared -fPIC `pkg-config gtk+-x11-2.0 --cflags --libs` -o $@ $<

install-gtk3: gtk3.so
	install -Dm755 gtk3.so $(gtk3_install)

install-gtk2: gtk2.so
	install -Dm755 gtk2.so $(gtk2_install)


uninstall-gtk3:
	rm -f $(gtk3_install)

uninstall-gtk2:
	rm -f $(gtk2_install)
