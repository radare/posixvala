tests = ['clock', 'getset', 'main', 'lambda', 'test2', 'posix', 'linux']

posix_dep = meson.get_compiler('vala').find_library('posix')
linux_dep = meson.get_compiler('vala').find_library('linux')

foreach name : tests
    test(name, executable(name, name + '.vala',
                          dependencies: [glib_posix_dep, gobject_posix_dep, posix_dep, linux_dep]))
endforeach
