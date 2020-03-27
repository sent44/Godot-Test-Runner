class_name unit_test #extends Object
extends Node

#func _ready():
#	pass

func get_test_method_list() -> Array:
	var list : Array = get_method_list()
	var test_list : Array = []
	for method in list:
		if method.name.begins_with("test_"):
			test_list.append(method)
	return test_list

func start():
	if has_method("_setup"):
		call("_setup")
	#assert(true)

func do_test(var method:String):
	if has_method(method):
		call(method)

func cleanup():
	if has_method("_teardown"):
		call("_teardown")

#func _assert(var cond : bool, var msg : String = ""): is_true(cond, msg)
#func assert(var cond : bool, var msg : String = ""): is_true(cond, msg)
func _is(var cond : bool, var msg : String = ""): is_true(cond, msg)
func _is_true(var cond : bool, var msg : String = ""): is_true(cond, msg)
func is_true(var cond : bool, var msg : String = ""):
	if !cond:
		print(msg) #catch(msg)

func _not(var cond : bool, var msg : String = ""): is_false(cond, msg)
#func not(var cond : bool, var msg : String = ""): is_false(cond, msg)
func _is_not(var cond : bool, var msg : String = ""): is_false(cond, msg)
func _is_false(var cond : bool, var msg : String = ""): is_false(cond, msg)
func is_false(var cond : bool, var msg : String = ""):
	is_true(!cond, msg)

func _same(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func same(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func is_same(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func _is_same(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func _equal(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func _is_equal(var a, var b, var msg : String = ""): is_equal(a, b, msg)
func is_equal(var a, var b, var msg : String = ""):
	is_true(a == b, msg)

func _not_same(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func not_same(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func is_not_same(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func _is_not_same(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func not_equal(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func _is_not_equal(var a, var b, var msg : String = ""): is_not_equal(a, b, msg)
func is_not_equal(var a, var b, var msg : String = ""):
	is_false(a == b, msg)

func _almost_same(var a:float, var b:float, var msg : String = ""): almost_equal(a, b, msg)
func almost_same(var a:float, var b:float, var msg : String = ""): almost_equal(a, b, msg)
func _almost_equal(var a:float, var b:float, var msg : String = ""): almost_equal(a, b, msg)
func almost_equal(var a:float, var b:float, var msg : String = ""):
	is_true(is_equal_approx(a, b), msg)

func _not_almost_same(var a:float, var b:float, var msg : String = ""): not_almost_equal(a, b, msg)
func not_almost_same(var a:float, var b:float, var msg : String = ""): not_almost_equal(a, b, msg)
func _not_almost_equal(var a:float, var b:float, var msg : String = ""): not_almost_equal(a, b, msg)
func not_almost_equal(var a:float, var b:float, var msg : String = ""):
	is_false(is_equal_approx(a, b), msg)

func _is_null(var obj, var msg : String = ""): is_null(obj, msg)
func is_null(var obj, var msg : String = ""):
	is_true(obj == null, msg)

func _not_null(var obj, var msg : String = ""): is_not_null(obj, msg)
func not_null(var obj, var msg : String = ""): is_not_null(obj, msg)
func _is_not_null(var obj, var msg : String = ""): is_not_null(obj, msg)
func is_not_null(var obj, var msg : String = ""):
	is_false(obj == null, msg)
