extends KinematicBody

const GRAVITY = Vector3(0, -9.3, 0)

const STRAFE = 3

var starting_position : Vector3

var lane = 0

func _ready():
	starting_position = translation
	
	
	

func _get_direction():
	var transform = Transform($Forward.global_transform.basis)
	return transform.xform($Forward.cast_to)

func _physics_process(delta):
	var forward_speed = 0
	
	if Input.is_action_pressed("ui_up"):
		forward_speed = 10
		
	if Input.is_action_just_pressed("ui_left"):
		lane -= 1

	if Input.is_action_just_pressed("ui_right"):
		lane += 1		
	
	lane = max(-1, min(1, lane))
	
	translation.x = starting_position.x - lane * STRAFE
	
	
	var forward = _get_direction() * forward_speed
	move_and_slide(GRAVITY + forward)
	
