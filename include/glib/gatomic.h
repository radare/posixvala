#ifndef __G_ATOMIC__
#define __G_ATOMIC__

#define g_once_init_enter(x) ((*(x) == 0) ? TRUE : FALSE)
#define g_once_init_leave(x,y) (*(x) = y)

#endif /* __G_ATOMIC__ */
