extends Area2D
@onready var plr = $"../player"

func _on_range_body_entered(body):
	if body == plr:
		queue_free()
