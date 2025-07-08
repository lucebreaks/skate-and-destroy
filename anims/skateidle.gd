extends Node3D

@onready var anim_statemachine: AnimationTree = $AnimStatemachine
@onready var vehicle_body_3d: VehicleBody3D = $".."

var blend_amount := 0.0
var crouch_blend_amount := 0.0
var ollieblend_amount := 0.0
var landingblend_amount := 0.0
var olliestart_amount := 0.0
var manualstart_amount := 0.0
var manualend_amount := 0.0
var manualblend_amount := 0.0
@export	var blend_speed := 3.0

var floor_check = false;


func _process(delta: float) -> void:

	
	if Input.is_action_pressed("push"):
			blend_amount = move_toward(blend_amount, 1.0, blend_speed * delta)
	else:
			blend_amount = move_toward(blend_amount, 0.0, blend_speed * delta)

	if Input.is_action_pressed("ollie"):
		crouch_blend_amount = move_toward(crouch_blend_amount, 1.0, blend_speed * delta)
		anim_statemachine["parameters/conditions/jump_start"] = true	
		floor_check = false;
	if Input.is_action_just_released("ollie"):
		ollieblend_amount = move_toward(ollieblend_amount, 1.0, blend_speed * delta)
		anim_statemachine["parameters/conditions/jump_start"] = false
		anim_statemachine["parameters/conditions/jump_release"] = true

		
			
		await get_tree().create_timer(1.0).timeout
		floor_check = true;
		if vehicle_body_3d.is_on_floor():
			landingblend_amount = move_toward(landingblend_amount, 1.0, blend_speed * delta)
			crouch_blend_amount = 0.0
			anim_statemachine["parameters/conditions/jump_release"] = false
			anim_statemachine["parameters/conditions/jump_end"] = true
			anim_statemachine["parameters/conditions/canSkate"] = true

			await get_tree().create_timer(0.25).timeout
			anim_statemachine["parameters/conditions/jump_end"] = false

			
	

	blend_amount = clamp(blend_amount, 0.0, 1.0)
	anim_statemachine["parameters/idle_Skate/blend_position"] = blend_amount
	anim_statemachine["parameters/crouch_blend/Crouch_anim/blend_amount"] = crouch_blend_amount
	
	
