extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(float) var impulse = 0.0
export(float) var max_impulse = 200.0
var selected = false

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
	
	var left_held = Input.is_action_pressed("ui_left")
	var right_held = Input.is_action_pressed("ui_right")
	var up_held = Input.is_action_pressed("ui_up")
	var down_held = Input.is_action_pressed("ui_down")
	
	
	var only_right_just_released = Input.is_action_just_released("ui_right") && !(left_held || up_held || down_held)
	var only_left_just_released = Input.is_action_just_released("ui_left") && !(right_held || up_held || down_held)
	var only_up_just_released = Input.is_action_just_released("ui_up") && !(left_held || right_held || down_held)	
	var only_down_just_released = Input.is_action_just_released("ui_down") && !(left_held || up_held || right_held)
	
	
	if (only_right_just_released):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(impulse, 0))
		impulse = 0
		
	if (only_left_just_released):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(-impulse, 0))
		impulse = 0
	
	if (only_up_just_released):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(0, -impulse))
		impulse = 0
		
	if (only_down_just_released):
		set_linear_damp(1.15)
		apply_impulse(Vector2(), Vector2(0, impulse))
		impulse = 0
	

	pass