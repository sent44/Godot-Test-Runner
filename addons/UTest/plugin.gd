tool extends EditorPlugin

var UI : Control

func _enter_tree():
	UI = preload("res://addons/UTest/UI.tscn").instance(PackedScene.GEN_EDIT_STATE_DISABLED)
	add_control_to_bottom_panel(UI, "Test Runner")

func _exit_tree():
	
	remove_control_from_bottom_panel(UI)
	UI.free()
