/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

static inline const char *g_quark_to_string(GQuark q) { return "Error"; }
#define g_error_new(x,y,z) (GError*)strdup (z)
#define g_error_free(x) free(x->message),free(x)
#define g_clear_error free
#define g_propagate_error(x,y) *x=y
typedef struct _GError GError;
struct _GError {
	GQuark       domain;
	gint         code;
	gchar       *message;
};
static inline GError *g_error_new_literal(int x, int y, const char *msg) {
	GError *err = g_new0 (GError, 1);
	err->domain = x;
	err->code = y;
	err->message = strdup (msg);
	return err;
}
