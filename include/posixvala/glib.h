/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef _GLIB_H_
#define _GLIB_H_

#ifdef __cplusplus
 #define G_BEGIN_DECLS	extern "C" {
 #define G_END_DECLS	}
#else
 #define G_BEGIN_DECLS
 #define G_END_DECLS
#endif /* __cplusplus */

#define emscripten_eval(x) eval(x)

G_BEGIN_DECLS

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define G_LIKELY(expr) (expr)
#define G_UNLIKELY(expr) (expr)
#define G_LOG_DOMAIN "ERROR"
#define G_STRFUNC __func__
#define g_assertion_message_expr(domain,file,line,func,expr)		\
do {									\
	if (!expr) {							\
		fprintf(stderr, "**\n%s:%s:%d:%s: %s\n",		\
			domain, file, line, func,			\
			"code should not be reached");			\
	} else {							\
		fprintf(stderr, "**\n%s:%s:%d:%s: "			\
				"assertion failed: (%s)\n",		\
				domain, file, line, func, expr);	\
	}								\
	abort();							\
} while (0)

#define GTypeInterface void*
#define GQuark unsigned long
#define g_quark_from_static_string(x) ((GQuark)(size_t)(x))
#define gfloat float
#define gdouble double
#define gchar char
#define uchar unsigned char
#define ushort unsigned short
#define gushort unsigned short
#define ulong unsigned long
#define gulong unsigned long
#define gpointer void*
#define gboolean int
#define gint8 char
#define guint8 unsigned char
#define gint int
#define gint16 short
#define guint16 unsigned short
#define guint unsigned int
#define gint32 int
#define guint32 unsigned int
#define gint64 long long
#define guint64 unsigned long long
#define gunichar guint32
#define glong long
#define gdouble double
#define gsize size_t
#define gssize ssize_t
#define g_new0(x,y) (x*)calloc (y, sizeof(x));
#define g_slice_new0(x) (x*)calloc (1, sizeof(x));
#define g_return_if_fail(x) if(!(x)) return;
#define g_return_val_if_fail(x,y) if (!(x)) return y;
#define g_slice_free(x,y) free(y)
//#define g_enum_register_static(x,y) (int)(size_t)(y),0
#define g_enum_register_static(x,y) 0

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
#define g_boxed_type_register_static(x, y, z) g_str_hash(x)

static inline void g_type_init() {}
static inline void g_boxed() {}
typedef gpointer (*GBoxedCopyFunc)(gpointer s);
typedef void (*GBoxedFreeFunc)(gpointer s);
typedef void (*GFunc)(gpointer data, gpointer user_data);
typedef void (*GDestroyNotify)(gpointer data);

#define GLIB_CHECK_VERSION(m,n,o) TRUE

#include "glib-string.h"
#include "glib-list.h"
#include "glib-error.h"

G_END_DECLS

#endif /* _GLIB_H_ */
