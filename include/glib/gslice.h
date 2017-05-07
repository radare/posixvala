#ifndef __G_SLICE_H__
#define __G_SLICE_H__

#define g_slice_new0(x) (x*)calloc (1, sizeof(x));
#define g_slice_free(x,y) free(y)

#endif /* __G_SLICE_H__ */
