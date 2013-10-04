/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef _POSIXVALA_RUNTIME_ERROR_H_
#define _POSIXVALA_RUNTIME_ERROR_H_

#define error_new(x,y,z) error_new_literal(x, y, z)
#define error_free(x) (free(x->message), free(x))
#define propagate_error(x,y) (*x = y)

typedef struct _Error {
	Quark	domain;
	int	code;
	char *	message;
} Error;

static inline Error *error_new_literal(Quark x, int y, const char *msg) {
	Error *err = new0 (Error, 1);
	err->domain = x;
	err->code = y;
	err->message = strdup (msg);
	return err;
}

static inline void clear_error(Error **e) {
	if (*e)
		free(*e);
}

#endif /* _POSIXVALA_RUNTIME_ERROR_ */
