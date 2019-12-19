extends StaticBody

var tree = preload("res://Tree.tscn")
var deer = preload("res://Models/Deer/Deer.tscn")

const MIN_TREES = 0
const MAX_TREES = 2

const MIN_DEER = 0
const MAX_DEER = 2


func _ready():
	recreate()

func recreate():
	for child in $Trees.get_children():
		child.queue_free()
	for child in $Deers.get_children():
		child.queue_free()
		
	randomize()
	
	var tree_count = randi() % MAX_TREES + MIN_TREES
	for index in range(0, tree_count):
		var total_locations = $TreeSpawnLocations.get_child_count()
		var position = $TreeSpawnLocations.get_children()[randi() % total_locations]
		var instance = tree.instance()
		instance.translation = position.translation
		instance.translation.y = 4.5
		$Trees.add_child(instance)

	var deer_count = randi() % MAX_TREES + MIN_TREES
	for index in range(0, deer_count):
		var total_locations = $DeerSpawnLocations.get_child_count()
		var position = $DeerSpawnLocations.get_children()[randi() % total_locations]
		var instance = deer.instance()
		instance.translation = position.translation
		instance.rotation_degrees.y = randi() % 360
		$Deers.add_child(instance)
