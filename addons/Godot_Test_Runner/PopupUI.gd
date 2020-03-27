tool extends PopupPanel

func _on_item_right_click(position):
	var tree : Tree = get_parent()
	var item : TreeItem = tree.get_item_at_position(position)
	if(item != tree.get_root()):
		rect_global_position = get_global_mouse_position()
		popup()
