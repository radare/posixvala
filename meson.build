project('posixvala', 'c', 'vala')

glib_posix_dep = declare_dependency(include_directories: include_directories('include'),
                                    sources: 'vapi/glib-posix-2.0.vapi')

gobject_posix_dep = declare_dependency(include_directories: include_directories('include'),
                                       sources: 'vapi/gobject-posix-2.0.vapi')


pkgconfig = import('pkgconfig')

pkgconfig.generate(name: 'glib-posix-2.0',
                   version: '0.2',
                   description: '',
                   subdirs: 'glib-posix-2.0')

pkgconfig.generate(name: 'gobject-posix-2.0',
                   version: '0.2',
                   description: '',
                   requires: 'glib-posix-2.0',
                   subdirs: 'glib-posix-2.0')

subdir('include')
subdir('vapi')
subdir('tests')
