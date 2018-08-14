extends RigidBody2D

var MoveSpeed = 1000

func _ready():
	pass

func _process(delta):
	var ui_right = Input.is_action_pressed("ui_right")
	var ui_left = Input.is_action_pressed("ui_left")
	
	var velocity = Vector2()
	
	if ui_right:
		velocity.x += 1
	elif ui_left:
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * MoveSpeed

	position += velocity * delta


