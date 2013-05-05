#include <stdarg.h>

#define HAVE_ASPRINTF 1

static inline char *g_strdup_printf(const char *fmt, ...) {
	char *buf = NULL;
	va_list ap;
	va_start (ap, fmt);
#if HAVE_ASPRINTF
	vasprintf (&buf, fmt, ap);
#else
	buf = malloc (1024 + strlen (fmt)*2);
	vsprintf (buf, fmt, ap);
	buf = realloc (buf, strlen (buf)+1);
#endif
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
