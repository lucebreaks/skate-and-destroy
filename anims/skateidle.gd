extends Node3D

@onready var animation_tree: AnimationTree = $AnimationTree

var blend_amount := 0.0
@export	var blend_speed := 3.0
 
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("push"):
			blend_amount = move_toward(blend_amount, 1.0, blend_speed * delta)
	else:
			blend_amount = move_toward(blend_amount, 0.0, blend_speed * delta)
			



	blend_amount = clamp(blend_amount, 0.0, 1.0)

	animation_tree["parameters/Blend2/blend_amount"] = blend_amount
