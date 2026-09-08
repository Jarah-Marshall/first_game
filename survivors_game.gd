extends Node2D

@onready var game_over = $GameOverSound

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%TreeSpawnFollow.progress_ratio = randf()
	new_tree.global_position = %TreeSpawnFollow.global_position
	add_child(new_tree)
	
	
func _on_timer_timeout():
	spawn_mob()
	spawn_tree()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	game_over.play()
	
