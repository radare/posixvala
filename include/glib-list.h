/* TODO */

#ifndef _GLIB_LIST_H_
#define _GLIB_LIST_H_

typedef struct _GList GList;
struct _GList {
	gpointer data;
	GList *next;
	GList *prev;
};

#define _g_list_alloc() calloc(1, sizeof(GList))

static inline void g_list_free(GList *list) {
	GList *current, *tmp;
	current = list;
	while (current) {
		tmp = current->next;
		free(current);
		current = tmp;
	}
}

static inline GList* g_list_last (GList *list) {
	if (list)
		while (list->next)
			list = list->next;
	return list;
}

static inline GList* g_list_append (GList *list, gpointer data) {
	GList *new_list = _g_list_alloc ();
	GList *last;
	if (!new_list) return NULL;
	new_list->data = data;
	new_list->next = NULL;
	if (list) {
		last = g_list_last (list);
		last->next = new_list;
		new_list->prev = last;
		return list;
	}
	new_list->prev = NULL;
	return new_list;
}

static inline GList* g_list_prepend (GList *list, gpointer data) {
	GList *new_list = _g_list_alloc ();
	new_list->data = data;
	new_list->next = list;
	if (list) {
		new_list->prev = list->prev;
		if (list->prev)
			list->prev->next = new_list;
		list->prev = new_list;
	} else new_list->prev = NULL;
	return new_list;
}

static inline void g_list_foreach (GList *list, GFunc func, gpointer user_data) {
	while (list) {
		GList *next = list->next;
		(*func) (list->data, user_data);
		list = next;
	}
}

/* slist */
#define GSList GList
#define g_slist_append g_list_append
#define g_slist_prepend g_list_prepend
#define g_slist_foreach g_list_foreach
#define g_slist_free g_list_free

#endif /* _GLIB_LIST_H_ */
