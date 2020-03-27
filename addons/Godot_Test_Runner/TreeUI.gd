tool extends Tree

var dir_path : String
var file_query : Resource
var files_stack : Array

var root : TreeItem

enum file_type {
	dictionary,
	file,
	method
}

enum file_stack {
	name,
	type,
	stack,
	#test_result
}

func _enter_tree():
	dir_path = get_script().get_path().get_base_dir()
	file_query = load(dir_path + "/FileQuery.gd")
	files_stack = file_query.call("get_files_stack", "res://")
	
	set_column_title(0, "Test File")
	set_column_title(1, "Result")
	set_column_titles_visible(true)
	
	root = create_item()
	root.set_text(0, "root")
	create_tree("res://")

func _exit_tree():
	clear()

func create_tree(var path : String, var last_tree:TreeItem = root, var stack:Array = files_stack):
	clear()
	var tree : TreeItem = create_item(last_tree)
	tree.set_text(0, path)
	create_leaves(tree, stack)

func create_leaves(var last_tree:TreeItem = root, var stack:Array = files_stack):
	for item in stack:
		var tree : TreeItem = create_item(last_tree)
		tree.set_text(0, item[file_stack.name])
		match item[file_stack.type]:
			file_type.dictionary:
				create_leaves(tree, item[file_stack.stack])
			_:
				pass 
