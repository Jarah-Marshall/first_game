extends Node2D

@onready var game_over = $GameOverSound
@onready var spawn_timer = $Timer

var wave = 1
var number_of_mobs = 5
var mobs = 0


func start_next_wave():
	mobs = 0
	if wave % 5 == 0:
		%WaveLabel.text = "BOSS WAVE! "
		%CurrentWave.visible = true
		await get_tree().create_timer(3.0).timeout
		
		number_of_mobs = 0
		spawn_boss_slime()
	else:
		if wave > 1:
			number_of_mobs = wave * 10
			mobs = 0
		else:
			number_of_mobs = 5
			
		spawn_timer.start()

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	
	new_mob.mob_died.connect(check_wave_status)
	
	if(wave > 1):
		var max_health = 3 + (wave * 2.5)
		new_mob.set_health(max_health)
	
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
	mobs += 1
	
func spawn_boss_slime():
	var boss = preload("res://mob.tscn").instantiate()
	
	boss.mob_died.connect(check_wave_status)
	
	boss.set_health(50 + (wave * 3))
	boss.scale = Vector2(5.0,5.0)
	
	%PathFollow2D.progress_ratio = randf()
	boss.global_position = %PathFollow2D.global_position
	
	add_child(boss)
	mobs = 1
	
	
#func spawn_tree():
	#var new_tree = preload("res://pine_tree.tscn").instantiate()
	#%TreeSpawnFollow.progress_ratio = randf()
	#new_tree.global_position = %TreeSpawnFollow.global_position
	#add_child(new_tree)
	#
	
func _on_timer_timeout():
	if(number_of_mobs > 0):
		spawn_mob()
		number_of_mobs -= 1
	else:
		spawn_timer.stop()
		
	#spawn_tree()
	
func check_wave_status():
	mobs -= 1
		
	if mobs <= 0 and number_of_mobs <= 0:
	
		wave +=1 
		
		%WaveLabel.text = "Wave " + str(wave) + " Starting Soon..."
		%CurrentWave.visible = true
		await get_tree().create_timer(3.0).timeout
		%CurrentWave.visible = false
		
		start_next_wave();
	


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	game_over.play()
	
