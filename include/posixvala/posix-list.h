/* TODO */

#ifndef _POSIXVALA_RUNTIME_LIST_H_
#define _POSIXVALA_RUNTIME_LIST_H_

#define _list_alloc() calloc(1, sizeof(List))

typedef struct _List List;
struct _List {
	void *data;
	List *next;
	List *prev;
};

static inline void list_free(List *list) {
	List *current, *tmp;
	current = list;
	while (current) {
		tmp = current->next;
		free(current);
		current = tmp;
	}
}

static inline List* list_last (List *list) {
	if (list)
		while (list->next)
			list = list->next;
	return list;
}

static inline List* list_append (List *list, void *data) {
	List *new_list = _list_alloc ();
	List *last;
	if (!new_list) return NULL;
	new_list->data = data;
	new_list->next = NULL;
	if (list) {
		last = list_last (list);
		last->next = new_list;
		new_list->prev = last;
		return list;
	}
	new_list->prev = NULL;
	return new_list;
}

static inline List* list_prepend (List *list, void *data) {
	List *new_list = _list_alloc ();
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

static inline void list_foreach (List *list, Func func, void *user_data) {
	while (list) {
		List *next = list->next;
		(*func) (list->data, user_data);
		list = next;
	}
}

/* slist */
#define SList List
#define slist_append list_append
#define slist_prepend list_prepend
#define slist_foreach list_foreach
#define slist_free list_free

#endif /* _POSIXVALA_RUNTIME_LIST_H_ */
