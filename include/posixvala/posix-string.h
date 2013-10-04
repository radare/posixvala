#ifndef _POSIXVALA_RUNTIME_STRING_H_
#define _POSIXVALA_RUNTIME_STRING_H_

/* For vsnprintf(3) */
#ifndef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE 200112L
#endif /* _POSIX_C_SOURCE */

#include <stdarg.h>

static inline unsigned int str_hash(const void *v) {
	const char *str = v;
	unsigned int hash = 5381;
	char c;

	while ((c = *str++))
		hash = ((hash << 5) + hash) + c;

	return hash;
}

static inline char *strdup_printf(const char *fmt, ...) {
	unsigned int length;
	char *buf = NULL;
	va_list ap;
	va_start (ap, fmt);
	length = (unsigned int)vsnprintf(buf, 0, fmt, ap);
	buf = calloc(length + 1, sizeof(char));
	vsnprintf(buf, length + 1, fmt, ap);
	va_end (ap);
	return buf;
}

static inline char *strconcat(const char *str, ...) {
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

#endif /* _POSIXVALA_RUNTIME_STRING_H_ */
