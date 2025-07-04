extends VehicleBody3D

var skateidle

@export var MAX_STEER = 0.9
@export var ENGINE_POWER = 80
@export var jump_impulse = 20

func _physics_process(delta):
	steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 10)
	engine_force = Input.get_axis("brake","push") * ENGINE_POWER

	
func get_point_velocity(point: Vector3) -> Vector3:
	return VehicleBody3D.linear_velocity * VehicleBody3D.angular_velocity.cross(point - VehicleBody3D.global_position)
	
# following code is first attempt at raycast physics, it failed.
func apply_z_force(collision_point):
	var dir:Vector3 = global_basis.z
	var tire_world_vel: Vector3 = get_point_velocity(global_position)
	var z_force = dir.dot(tire_world_vel) * VehicleBody3D.mass / 40
	
	skateidle.apply_force(-dir * z_force, collision_point - skateidle.global_position)
	
	var point = Vector3(collision_point.x, collision_point.y + VehicleBody3D.steering, collision_point.z)
	
	

		
	
	
