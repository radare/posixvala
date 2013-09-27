#ifndef _GLIB_STRING_H_
#define _GLIB_STRING_H_

#include <stdarg.h>

/* For vsnprintf(3) */
#ifndef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200112L
#endif /* _POSIX_C_SOURCE */

static inline char *g_strdup_printf(const char *fmt, ...) {
	unsigned int length;
	char *buf = NULL;
	va_list ap;
	va_start (ap, fmt);
	/* Get the length of the result */
	length = (unsigned int)vsnprintf(buf, 0, fmt, ap);
	/* Must include space for the NULL-terminating byte. */
	buf = calloc(length + 1, sizeof(char));
	/* Actually create string, copies NULL byte too */
	vsnprintf(buf, length + 1, fmt, ap);
	va_end (ap);
	return buf;
}

static inline char *g_strconcat(const char *str, ...) {
	int plen, olen;
	const char *p;
	char *out;
	va_list ap;

	va_start (ap, str);
	out = strdup (str);
	olen = strlen (out);
	for (;;) {
        	p = va_arg (ap, char*);
		if (!p) break;
		plen = strlen (p);
		out = realloc (out, plen + olen+1);
		strcpy (out+olen, p);
		olen += plen;
	}
	va_end (ap);
	return out;
}

#endif /* _GLIB_STRING_H_ */
