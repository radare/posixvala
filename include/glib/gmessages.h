#ifndef __G_MESSAGES__
#define __G_MESSAGES__

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

#define g_print printf
#define g_message printf
#define g_critical printf
#define g_error printf

#endif /* __G_MESSAGES__ */
