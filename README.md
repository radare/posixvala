posixvala
=========

This project aims to bring back the posix profile for Vala.

Instead of modifying the compiler, posixvala reimplements the
basic features of GLib in tiny include files to let the generated
C code compile without any other dependency than libc.

Not all features of Vala are currently supported by posixvala
and it is not suposed to perform as well as GLib (lacks slices
and other libraries) and posixvala programs cannot link against
glib libraries.

Current supported features are:

* Vala and Genie
* compact classes
* string processing
* List and SList
* exceptions
* delegates
* structs
