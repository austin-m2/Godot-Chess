extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pieces
var array


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pieces = get_node("../pieces")
	array = pieces.get_children()
	print(array[0].get_name())
	#for i in array:
	
	
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pieces
	pass
