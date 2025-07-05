extends Node3D

@onready var animation_tree: AnimationTree = $AnimationTree

var blend_amount := 0.0
@export	var blend_speed := 3.0
var skate_amount := 0.0
var jump := 0.0

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("push"):
			blend_amount = move_toward(blend_amount, 1.0, blend_speed * delta)
	else:
			blend_amount = move_toward(blend_amount, 0.0, blend_speed * delta)

	if Input.is_action_pressed("ollie"):
			skate_amount = move_toward(skate_amount, 1.0, blend_speed * delta)
	else:
			skate_amount = move_toward(skate_amount, 0.0, blend_speed * delta)
	if Input.is_action_just_released("ollie"):
			jump = move_toward(0, 1.0, blend_speed * delta)
	else:
			jump = move_toward(0, 0.0, blend_speed * delta)

	blend_amount = clamp(blend_amount, 0.0, 1.0)

	animation_tree["parameters/skate/blend_amount"] = blend_amount
	animation_tree["parameters/ollieblend/blend_amount"] = skate_amount
	animation_tree.set("parameters/olliejump/active", false)
	await olliejump.play_turn().completed 
	animation_tree.set("parameters/olliejump/active", true)
