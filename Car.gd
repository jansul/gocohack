extends KinematicBody

const GRAVITY = Vector3(0, -9.3, 0)

const STRAFE = 3

var starting_position : Vector3
var distance_since_start = 0
var forward_speed = 10
var base_speed = 10
var lane = 0
var section_length = 100
var collided = false

func _ready():
	starting_position = translation
	
func _get_direction():
	var transform = Transform($Forward.global_transform.basis)
	return transform.xform($Forward.cast_to)

func _physics_process(delta):
	if not collided:
		_process_lanes(delta)
		_process_movement(delta)
	
func _process_movement(delta):
	distance_since_start = (translation - starting_position).length()
	var section = floor(distance_since_start / section_length) + 1
	forward_speed = base_speed + section
			
	var forward = _get_direction() * forward_speed
	move_and_slide(GRAVITY + forward)
	
func _process_lanes(delta):
	if Input.is_action_just_pressed("ui_left"):
		lane -= 1

	if Input.is_action_just_pressed("ui_right"):
		lane += 1		
	
	lane = max(-1, min(1, lane))	
	translation.x = starting_position.x - lane * STRAFE
	
func _on_Detector_body_entered(body):
	collided = true
	print('collided!')
