extends RigidBody2D

export var speed = 25
var vel = Vector2()

func _ready():
	pass
	
	
func _physics_process(delta):
	var input = Vector2(0, 1)
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	vel = input.normalized() * speed
	set_position(get_position() + vel)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
