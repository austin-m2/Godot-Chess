extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(float) var impulse = 0.0
export(float) var max_impulse = 200.0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	
	if(Input.is_action_just_pressed("ui_right") ||
	   Input.is_action_just_pressed("ui_left") ||
	   Input.is_action_just_pressed("ui_down") ||
	   Input.is_action_just_pressed("ui_up")):
		set_linear_damp(5)
	
	if(Input.is_action_pressed("ui_right") ||
	   Input.is_action_pressed("ui_left") ||
	   Input.is_action_pressed("ui_down") ||
	   Input.is_action_pressed("ui_up")):
		impulse += 5


	impulse = clamp(impulse, 0, 400)
	#print(impulse)
	
	
	if (Input.is_action_just_released("ui_right")):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(impulse, 0))
		impulse = 0
		
	if (Input.is_action_just_released("ui_left")):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(-impulse, 0))
		impulse = 0
	
	if (Input.is_action_just_released("ui_up")):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(0, -impulse))
		impulse = 0
		
	if (Input.is_action_just_released("ui_down")):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(0, impulse))
		impulse = 0
	
	
	

	
#	if (Input.is_action_just_pressed("ui_right")):
#		apply_impulse(Vector2(), Vector2(impulse, 0))
#	if (Input.is_action_just_pressed("ui_left")):
#		apply_impulse(Vector2(), Vector2(-impulse, 0))
#	if (Input.is_action_just_pressed("ui_up")):
#		apply_impulse(Vector2(), Vector2(0, -impulse))
#	if (Input.is_action_just_pressed("ui_down")):
#		apply_impulse(Vector2(), Vector2(0, impulse))
	pass