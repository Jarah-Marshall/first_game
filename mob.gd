extends CharacterBody2D

signal mob_died

var health = 3
var damage = 5;

@onready var player = get_node("/root/Game/Player")
@onready var mob_damage = $MobDamage

func _ready():
	%Slime.play_walk()
	
func set_health(max_health: int):
	health = max_health
	%MobHealthbar.max_value = max_health
	%MobHealthbar.value = max_health

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 225.0
	move_and_slide()
	
func take_damage(amount: int):
	health -= amount
	%MobHealthbar.value = health
	%Slime.play_hurt()
	mob_damage.play()
	
	if health <= 0:
			die()
		
		
func take_missle_damage(amount: int):
	health -= amount
	%MobHealthbar.value = health
	%Slime.play_hurt()
	mob_damage.play()
	
	if health <= 0:
			die()
	
func die():
		mob_died.emit()
		queue_free()
		
		if player.has_method("enemy_defeated"):
			player.enemy_defeated()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
	
		smoke.global_position = global_position
