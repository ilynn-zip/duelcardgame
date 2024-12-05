extends Camera3D

@export var distance : float = 100.0

@onready var hand: Node3D = $Hand
@onready var raycast: RayCast3D = $RayCast3D
@onready var coursor_position : Vector2

func _process(delta: float) -> void:
	#coursor_raycast()
	pass
	
func _physics_process(delta: float) -> void:
	#coursor_raycast()
	pass

func coursor_raycast():
	coursor_position = get_viewport().get_mouse_position()
	raycast.target_position = project_local_ray_normal(coursor_position) * distance
	raycast.force_raycast_update()
	
	if raycast.is_colliding():
		print('fuck')
