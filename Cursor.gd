extends KinematicBody2D

var velocity = Vector2.ZERO

var SPEED = 625
var WRAP_THRESHOLD = 80

func _process(delta):
	var relative_speed = velocity.length() / SPEED
	self.modulate.a = relative_speed
	
	var viewport_rect = get_viewport_rect().size
	
	if position.x < -WRAP_THRESHOLD:
		position.x = viewport_rect.x + WRAP_THRESHOLD
	elif position.x > viewport_rect.x + WRAP_THRESHOLD:
		position.x = -WRAP_THRESHOLD
		
	if position.y < -WRAP_THRESHOLD:
		position.y = viewport_rect.y + WRAP_THRESHOLD
	elif position.y > viewport_rect.y + WRAP_THRESHOLD:
		position.y = -WRAP_THRESHOLD

func _physics_process(delta):
	var input_velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if (input_velocity != Vector2.ZERO):
		velocity = self.move_and_slide(input_velocity * SPEED)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.07)
