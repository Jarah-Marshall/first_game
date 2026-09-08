extends Area2D

@onready var bullet_sound = $BulletSound

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func shoot_missle():
	const MISSLE = preload("res://missle.tscn")
	
	var new_missle = MISSLE.instantiate()
	
	new_missle.global_position = %MissleSP.global_position
	new_missle.global_rotation = %MissleSP.global_rotation
	
	%MissleSP.add_child(new_missle)


func _on_timer_timeout():
	shoot()
	bullet_sound.play()

func _missle_on_timer_timeout():
	shoot_missle()
	bullet_sound.play()
