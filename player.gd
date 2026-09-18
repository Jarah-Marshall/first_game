extends CharacterBody2D

signal health_depleted
signal leveled_up(next_level)

@onready var player_damage = $PlayerDamage
var damage = 1;
var health = 100.0

var level = 1
var defeated_enemies = 0
var enemies_to_next_level = 5

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right",
	"move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		for mob in overlapping_mobs:
			
			health -= mob.damage * delta
			%ProgressBar.value = health
			player_damage.play()
		
		if health <= 0.0:
			health_depleted.emit()
			
func enemy_defeated():
	defeated_enemies += 1
	
	if defeated_enemies >= enemies_to_next_level:
		defeated_enemies = 0
		level_up()
			
			
func level_up():
	level += 1
	enemies_to_next_level += 15
	
	health += 5.0
	damage += 2

	$LevelUp.visible = true;
	await get_tree().create_timer(1.0).timeout
	$LevelUp.visible = false;
	
	leveled_up.emit(level)
	
