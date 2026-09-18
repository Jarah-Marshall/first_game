extends Area2D

var traveled_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

	traveled_distance += SPEED * delta
	
	if traveled_distance > RANGE:
		queue_free()
		


func _on_body_entered(body):
	if body.has_method("take_damage"):
		var player = get_node("/root/Game/Player")
		body.take_damage(player.damage)
	queue_free()
