/* LGPL3 - posixvala glib replacement - 2013 - pancake@nopcode.org */

#ifndef _POSIXVALA_RUNTIME_H_H_
#define _POSIXVALA_RUNTIME_H_H_

#ifdef __cplusplus
 #define BEGIN_DECLS	extern "C" {
 #define END_DECLS	}
#else
 #define BEGIN_DECLS
 #define END_DECLS
#endif /* __cplusplus */

BEGIN_DECLS

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define LIKELY(expr) (expr)
#define LOG_DOMAIN "ERROR"
#define STRFUNC __func__
#define assertion_message_expr(domain,file,line,func,expr)		\
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

#define TypeInterface void*
#define Type int
#define Quark unsigned int
#define quark_from_static_string(x) ((Quark)((size_t)(x)))
#define quark_to_string(q) ((const char *)((size_t)(q)))

#define new0(x,y) calloc (y, sizeof(x));
#define slice_new0(x) calloc (1, sizeof(x));
#define return_if_fail(x) if(!(x)) return;
#define return_val_if_fail(x,y) if (!(x)) return y;
#define slice_free(x,y) free(y)
#define enum_register_static(x,y) (int)(size_t)(y),0

#define critical printf

typedef struct _EnumValue {
	int x;
	const char *n;
	const char *m;
} EnumValue;

#define once_init_enter(x) ((*(x) == 0) ? 1 : 0)
#define once_init_leave(x,y) (*(x) = y)
#define boxed_type_register_static(x, y, z) (int)(x)

#define type_init
#define boxed

typedef void	(*Func)(void *, void *);
typedef void *	(*BoxedCopyFunc)(void *);
typedef void	(*BoxedFreeFunc)(void *);
typedef void	(*DestroyNotify)(void *);

#include "posix-string.h"
#include "posix-list.h"
#include "posix-error.h"

END_DECLS

#endif /* _POSIXVALA_RUNTIME_H_H_ */
