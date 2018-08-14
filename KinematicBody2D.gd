extends KinematicBody2D

const ACCEL = 1500
const WALK_SPEED = 250
const FRICTION = -250
const GRAVITY = 25
const MAX_GRAVITY = 500

var vel = Vector2()
var acc = Vector2()

func _ready():
	pass
	
func _process(delta):
	vel.y += GRAVITY
	if vel.y > MAX_GRAVITY:
		vel.y = MAX_GRAVITY
	
	vel.x = 0
	if Input.is_action_pressed("ui_left"):
		vel.x = -WALK_SPEED
		get_node("Sprite").set_flip_h(true)
		get_node("Sprite").get_node("AnimationPlayer").play("walking")
	elif Input.is_action_pressed("ui_right"):
		vel.x =  WALK_SPEED
		get_node("Sprite").set_flip_h(false)
		get_node("Sprite").get_node("AnimationPlayer").play("walking")
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y = -500
		
func _physics_process(delta):
	move_and_slide(vel, Vector2(0, -1))




