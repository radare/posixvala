#ifndef __G_QUARK_H__
#define __G_QUARK_H__

typedef uintptr_t GQuark;

#define g_quark_from_static_string(x) ((GQuark)(size_t)(x))
static inline const gchar *g_quark_to_string(GQuark q) {
	return (const gchar *)(size_t)q;
}

#endif /* __G_QUARK_H__ */
