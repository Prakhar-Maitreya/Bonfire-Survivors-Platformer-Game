extends CharacterBody2D
@export var speed = 300
@export var grav = 400
var found = false
@onready var plr = $"../player"
var plyr = null
@onready var anim = $sprites

func _physics_process(delta):
	moveSlime()
	anim.play("idle")
	
func moveSlime():
	gravity()
	traversal()
	move_and_slide()

func gravity():
	if !is_on_floor():
		velocity.y += grav
		if velocity.y > 1000:
			velocity.y = 1000


func traversal():
	if found and plyr == plr:
		var distance_to_player = plyr.global_position.x - global_position.x
		if abs(distance_to_player) > 1:
			var direction = sign(distance_to_player)
			velocity.x = direction * speed
		else:
			velocity.x = 0
	


func _on_range_body_entered(body):
	if body == plr:
		plyr = body
		found = true



func _on_range_body_exited(body):
	if body == plr:
		plyr = null
		found = false
		velocity.x = 0
