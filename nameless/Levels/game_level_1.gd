extends Node2D

#Devrait permetre de faire spwan les enemis toutes les 0.5 secondes
var enemy_spawn = preload("res://Characters/enemy.tscn") 
@onready var player = $Player

func _on_timer_timeout() -> void:

	var enemy = enemy_spawn.instantiate()

	enemy.global_position = player.global_position

	while enemy.global_position.distance_squared_to(player.global_position) < 10000 :
		enemy.global_position.x = randi_range(-get_viewport_rect().size.x, get_viewport_rect().size.x)
		enemy.global_position.y = randi_range(-get_viewport_rect().size.y, get_viewport_rect().size.y)

	add_child(enemy)
#Le code marche mais seul le premier enemis est visible
