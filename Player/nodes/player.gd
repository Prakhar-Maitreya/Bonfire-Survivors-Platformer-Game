extends CharacterBody2D
@onready var anim = $player_animations
@export var speed = 300
@export var grav = 300
@export var jump_force = 1000
var hrd
var horizontal_direction

func _physics_process(delta):
	player_movement()
	
	
func player_movement():
	gravity()
	horizontal_mov()
	jumping()
	move_and_slide()
	

func gravity():
	if !is_on_floor():
		velocity.y += grav
		if velocity.y > 1000:
			velocity.y = 1000

func horizontal_mov():
	if Input.is_action_pressed("left"):
		horizontal_direction = "left"
		velocity.x = -speed
		play_animation(1)
	elif Input.is_action_pressed("right"):
		horizontal_direction = "right"
		velocity.x = speed
		play_animation(1)
	else:
		velocity.x = 0
		play_animation(0)
	

func jumping():
	if Input.is_action_just_pressed('jump') && is_on_floor() :
		velocity.y = -jump_force
		play_animation(2)


func play_animation(movement):
	if movement == 2 or !is_on_floor():
		anim.play("jump")
	if horizontal_direction == "left":
		anim.flip_h = true
		if movement == 1 && is_on_floor():
			anim.play("run")
		elif movement == 0 && is_on_floor():
			anim.play("idle")
	elif horizontal_direction == "right":
		anim.flip_h = false
		if movement == 1 && is_on_floor():
			anim.play("run")
		elif movement == 0 && is_on_floor():
			anim.play("idle")

