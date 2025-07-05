extends Camera3D


#invisible node in the Player scene to look at, moving with the player
@onready var look_target : Node3D = $Player/CamTarget 

#refrence to player Node
@onready var player_node : Node3D = $Player 
# weight variable, controls the ratio of new and old camera position
@export var camera_lag : float = 0.8 

func _process(delta):
  global_position = player_node.global_position
  look_at(look_target.global_position)
