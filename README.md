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

Current supported features
--------------------------

* Vala and Genie
* Compact classes
* String processing
* List and SList
* Exceptions
* Delegates
* Inheritance
* Structs
* Lambdas
* Closures

Unsupported features
--------------------
* Abstract Classes (Requires non-compact)
* Async methods
* Non-compact classes
* Regular expressions
