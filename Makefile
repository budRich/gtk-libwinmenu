.PHONY: install uninstall

NAME   := libwinmenu.so

LIBDIR     := /usr/lib64
install_at := $(DESTDIR)$(LIBDIR)/gtk-2.0/modules

$(NAME): libwinmenu.c
	$(CC) -shared -fPIC `pkg-config gtk+-x11-2.0 --cflags --libs` -o $@ $<

install: $(NAME)
	install -Dm755 $(NAME) -t $(install_at)

uninstall:
	rm -f $(install_at)/$(NAME)
