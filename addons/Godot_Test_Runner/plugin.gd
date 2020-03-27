tool extends EditorPlugin

#const plugin_dir : String = "res://addons/Godot_Test_Runner"
#const UIdir : String = plugin_dir + "/UI.tscn"

var UI : Control
var test : Reference

func _enter_tree():
	UI = preload("UI.tscn").instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_control_to_bottom_panel(UI, "Test Runner")
	
#	test = load(plugin_dir + "/FileQuery.gd").new()
#	for a in test.get_method_list():
#		print(a.name)

func _exit_tree():
	
	remove_control_from_bottom_panel(UI)
	UI.free()
