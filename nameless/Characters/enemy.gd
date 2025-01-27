extends CharacterBody2D
var motion = Vector2()

func _physics_process(delta: float) -> void:
	var Player = get_parent().get_node("Player")
	
	position=position + (Player.position - position)/30

	look_at(Player.position)
	
	move_and_collide(motion)
