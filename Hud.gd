extends Control

export(NodePath) var car_path

var car : Spatial

func _ready():	
	car = get_node(car_path)	
	
	
func _process(delta):
	if car.collided:
		$"Game Over".visible = true
		
	else:
		$"Game Over".visible = false
		$"Hud/Distance Value".text =  "%dm" % car.distance_since_start
		$"Hud/Speed Value".text =  "%d" % car.forward_speed

func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")
