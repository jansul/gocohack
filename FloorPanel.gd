extends StaticBody

var tree = preload("res://Tree.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	recreate()

const MIN_TREES = 1
const MAX_TREES = 5

func recreate():
	for child in $Trees.get_children():
		child.queue_free()
	
	var tree_count = randi() % MAX_TREES + MIN_TREES
	print(tree_count)
	for index in range(0, tree_count):
		var total_locations = $TreeSpawnLocations.get_child_count()
		var position = $TreeSpawnLocations.get_children()[randi() % total_locations]
		var instance = tree.instance()
		instance.translation = position.translation
		instance.translation.y = 3
		add_child(instance)
			
		


	
	
	print('recreate')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
