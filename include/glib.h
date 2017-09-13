/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef __GLIB_H__
#define __GLIB_H__

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
#include <stdint.h>

#define G_LIKELY(expr) (expr)
#define G_UNLIKELY(expr) (expr)

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
#define g_return_if_fail(x) if(!(x)) return;
#define g_return_val_if_fail(x,y) if (!(x)) return y;

//#define g_enum_register_static(x,y) (int)(size_t)(y),0
#define g_enum_register_static(x,y) 0

#define TRUE 1
#define FALSE 0
#define G_GNUC_CONST

#define g_strdup strdup
typedef struct {
	int x;
	const char *n;
	const char *m;
} GEnumValue;

#define GLIB_CHECK_VERSION(m,n,o) TRUE

typedef void (*GFunc)(gpointer data, gpointer user_data);
typedef void (*GDestroyNotify)(gpointer data);

#include "glib/gatomic.h"
#include "glib/gerror.h"
#include "glib/glist.h"
#include "glib/gmem.h"
#include "glib/gmessages.h"
#include "glib/gquark.h"
#include "glib/gslice.h"
#include "glib/gstring.h"

G_END_DECLS

#endif /* __GLIB_H__ */
