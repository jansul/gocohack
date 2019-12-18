extends Spatial

export(NodePath) var car_path

var floor_panels = []

# Short dimension of the floor
var floor_width = 10.0
var car : Spatial

func _ready():	
	car = get_node(car_path)
	for floor_panel in get_children():
		floor_panels.append(floor_panel)
		
func _process(delta):
	var car_z = car.global_transform.origin.z
	
	for panel in floor_panels:
		var panel_z = panel.global_transform.origin.z
		if panel_z < car_z - floor_width:
			var new_z = panel_z + floor_width * len(floor_panels)
			panel.global_transform.origin.z = new_z
			panel.recreate()
		
	#for x in range(0, len(floor_panels)):
		#var index = floor(car_z / floor_width)
		#var panel = floor_panels[x]		
		#var offset = (index + x) * floor_width
		#panel.translation.z = offset
