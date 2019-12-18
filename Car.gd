extends KinematicBody

const GRAVITY = Vector3(0, -9.3, 0)



func _physics_process(delta):
	var forward_speed = 0
	
	if Input.is_action_pressed("ui_up"):
		forward_speed = 4;
	
	var forward = $Forward.cast_to * forward_speed
	move_and_slide(GRAVITY + forward)
	
