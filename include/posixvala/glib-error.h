/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef _GLIB_ERROR_H_
#define _GLIB_ERROR_H_

static inline const gchar *g_quark_to_string(GQuark q) {
	return (const gchar *)(size_t)q;
}
#define g_error_new(x,y,z) g_error_new_literal(x, y, z)
#define g_error_free(x) free(x->message),free(x)
#define g_clear_error free
#define g_propagate_error(x,y) *x=y
typedef struct _GError GError;
struct _GError {
	GQuark       domain;
	gint         code;
	gchar       *message;
};
static inline GError *g_error_new_literal(GQuark x, gint y, const gchar *msg) {
	GError *err = g_new0 (GError, 1);
	err->domain = x;
	err->code = y;
	err->message = strdup (msg);
	return err;
}

#endif /* _GLIB_ERROR_ */
