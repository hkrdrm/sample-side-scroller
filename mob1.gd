extends KinematicBody2D

const ACCEL = 1500
const WALK_SPEED = 150
const FRICTION = -250
const GRAVITY = 25
const MAX_GRAVITY = 500

var direction = -1
var vel = Vector2()
var acc = Vector2()

func _ready():
	pass

func _process(delta):
	vel.y += GRAVITY
	if vel.y > MAX_GRAVITY:
		vel.y = MAX_GRAVITY
	
	vel.x = WALK_SPEED * direction

	get_node("Sprite").get_node("AnimationPlayer").play("walking")
	

func _physics_process(delta):
	move_and_slide(vel, Vector2(0, -1))



func _on_container2_body_entered(body):
	direction *= -1
	get_node("Sprite").set_flip_h(false)


func _on_container1_body_entered(body):
	direction *= -1
	get_node("Sprite").set_flip_h(true)
