#ifndef __G_MEM_H__
#define __G_MEM_H__

#define g_new0(x,y) (x*)calloc (y, sizeof(x));
#define g_free free

#endif /* __G_MEM_H__ */
