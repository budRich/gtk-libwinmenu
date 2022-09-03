libwinmenu.c will compile to a *GTK module* (winmenu) that
when used, will hide the menubar of GTK2 and GTK3
applications, it also adds a keybinding for
toggling the menubar:
(<key>Ctrl</key>+<key>Alt</key>+<key>m</key>).

This version can compile to both a GTK2 and GTK3
compatible module. (By setting **GTK3_BUILD**).

### installation

```shell
git clone https://github.com/budRich/gtk-libwinmenu.git
cd gtk-libwinmenu
make
sudo make LIBDIR=/usr/lib install # adjust LIBDIR for your distribution
```

### usage

Set the following environment variable for changes
to take place: `GTK_MODULES=winmenu`  

To have it always apply (**NOT** recommended):  
`export GTK_MODULES=winmenu` (in `~/.xinitrc` or similar).

To apply module on a specific application:
`GTK_MODULES=winmenu thunar`

To use in `.desktop` files, set the **Exec** field to:  
`env GTK_MODULES=winmenu thunar`

(*thunar is just an example command*)

### known issues

Might not work properly with all applications
(hence not recommended to apply globally).
The following applications will always be ignored:  
`gnome-terminal, gimp-2.10, mousepad, arandr`

### credits

libwinmenu.c is based on the AUR packages
[gtk2-libwinmenu] and [gtk3-libwinmenu], which in turn
is based on post at the [linux.org.ru] forums.  
(`http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512`)

[linux.org.ru]: (http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512)
[gtk2-libwinmenu]: https://aur.archlinux.org/packages/gtk2-libwinmenu
[gtk3-libwinmenu]: https://aur.archlinux.org/packages/gtk3-libwinmenu
