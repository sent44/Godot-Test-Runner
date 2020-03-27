#tool
enum file_type {
	dictionary,
	file,
	method
}

static func get_files_stack(var root:String) -> Array:
	var dir : Directory = Directory.new()
	var stack : Array = []
	if dir.open(root) == OK:
		dir.list_dir_begin()
		var file = dir.get_next()
		while file != "":
			if !file.begins_with("."):
				var item : Array = []
				item.append(file)
				if dir.current_is_dir():
					item.append(file_type.dictionary)
					var new_stack : Array = []
					if root == "res://":
						new_stack = get_files_stack("res://" + file)
					else:
						new_stack = get_files_stack(root + "/" + file)
					if !new_stack.empty():
						item.append(new_stack)
						stack.append(item)
				else:
					if file.ends_with(".gd"):
						item.append(file_type.file)
						stack.append(item)
			file = dir.get_next()
	return stack
