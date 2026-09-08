extends Area2D

var traveled_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 600
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta

	traveled_distance += SPEED * delta
	
	if traveled_distance > RANGE:
		queue_free()
		


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_missle_damage"):
		body.take_missle_damage()
