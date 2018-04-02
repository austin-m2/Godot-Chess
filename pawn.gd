extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(float) var thrust_x = 0.5
var thrust

var mytexture = preload("res://pawn.png")

onready var last_frame_position = position


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_contact_monitor(true)
	set_max_contacts_reported(4)
	connect("body_entered", self, "_collided_with_something")
	randomize()
	
	thrust = Vector2(thrust_x, 0)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#draw_texture(mytexture, last_frame_position)


#	pass

func _physics_process(delta):
	add_force(Vector2(), thrust)
	#should be something like:
	#add_force(Vector2(), thrust * delta * 100)
	
	pass
	
func _draw():
	#draw_texture(mytexture, last_frame_position)

	pass
	
func _collided_with_something(otherbody):
	#thrust = Vector2(rand_range(-100,100), rand_range(-100,100))
	#print(thrust)
	