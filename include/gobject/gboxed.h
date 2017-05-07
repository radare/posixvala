#define g_boxed_type_register_static(x, y, z) g_str_hash(x)
static inline void g_boxed() {}
typedef gpointer (*GBoxedCopyFunc)(gpointer s);
typedef void (*GBoxedFreeFunc)(gpointer s);
