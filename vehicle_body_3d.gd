extends VehicleBody3D

var skateidle
@onready var br_wheel: VehicleWheel3D = $BR_Wheel
@onready var bl_wheel: VehicleWheel3D = $BL_Wheel
@onready var fr_wheel: VehicleWheel3D = $FR_Wheel
@onready var fl_wheel: VehicleWheel3D = $FL_Wheel
@onready var boardcast_2: RayCast3D = $boardcast2
@onready var boardcast_3: RayCast3D = $boardcast3

var floor_check = false;
@export var MAX_STEER = 0.9
@export var ENGINE_POWER = 80
@export var jump_impulse : float = 500.0


func is_on_floor():
	return (br_wheel.is_in_contact() && bl_wheel.is_in_contact() && fl_wheel.is_in_contact() && fr_wheel.is_in_contact())

func _physics_process(delta):
	print(is_on_floor())
	steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 10)
	engine_force = Input.get_axis("brake","push") * ENGINE_POWER
	
	if Input.is_action_just_released("ollie") && is_on_floor():
		apply_central_impulse(Vector3(0.0, jump_impulse, 0.0))
	
