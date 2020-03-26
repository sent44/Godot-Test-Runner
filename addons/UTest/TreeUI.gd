tool extends Tree

func _ready():
	set_column_title(0, "Test File")
	set_column_title(1, "Result")
	set_column_titles_visible(true)
	
	var root : TreeItem = create_item()
	root.set_text(0, "root")
	root.set_expand_right(0, true)
	var a : TreeItem = create_item(root)
	a.set_text(0, "omg")
	a.set_text(1, "haha")
	a.set_expand_right(0, true)

func _on_ui_destory():
	self.clear()
