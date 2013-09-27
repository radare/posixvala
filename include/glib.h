/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef _GLIB_H_
#define _GLIB_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef __cplusplus
 #define G_BEGIN_DECLS	extern "C" {
 #define G_END_DECLS	}
#else
 #define G_BEGIN_DECLS
 #define G_END_DECLS
#endif /* __cplusplus */

#define GTypeInterface void*
#define GQuark unsigned int
#define g_quark_from_static_string(x) ((GQuark)(x))
#define gchar char
#define gpointer void*
#define gboolean int
#define gint int
#define gdouble double
#define gsize size_t
#define g_new0(x,y) (x*)calloc (y, sizeof(x));
#define g_slice_new0(x) (x*)calloc (1, sizeof(x));
#define g_return_if_fail(x) if(!(x)) return;
#define g_return_val_if_fail(x,y) if (!(x)) return y;
#define g_slice_free(x,y) free(y)
#define g_enum_register_static(x,y) (int)(size_t)(y),0

#define g_critical printf
#define TRUE 1
#define FALSE 0
#define G_GNUC_CONST
#define GType int

#define g_print printf
#define g_strdup strdup
#define g_free free
typedef struct {
	int x;
	const char *n;
	const char *m;
} GEnumValue;

#define g_once_init_enter(x) ((*(x) == 0) ? TRUE : FALSE)
#define g_once_init_leave(x,y) (*(x) = y)
#define g_boxed_type_register_static(x, y, z) 0

static inline void g_type_init() {}
static inline void g_boxed() {}
typedef gpointer (*GBoxedCopyFunc)(gpointer s);
typedef void (*GBoxedFreeFunc)(gpointer s);
typedef void (*GFunc)(gpointer data, gpointer user_data);

#include "glib-string.h"
#include "glib-list.h"
#include "glib-error.h"

#endif /* _GLIB_H_ */
