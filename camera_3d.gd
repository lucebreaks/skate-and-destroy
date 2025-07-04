extends Camera3D
# camera you are positioning
@onready var the_cam : Camera = $Camera 

#invisible node in the Player scene to look at, moving with the player
@onready var look_target : Node3D = $Player/CamTarget 

#refrence to player Node
@onready var player_node : Node3D = $Player 
# weight variable, controls the ratio of new and old camera position
@export var camera_lag : float = 0.8 

func _physics_process(delta.
the_cam.look_at(look_target.global_position) 

#update camera position with lag
the_cam.global_position = lerp(player.global_position, \
   the_cam.global_position,\
   camera_lag)
