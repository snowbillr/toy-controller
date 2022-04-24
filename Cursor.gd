extends KinematicBody2D

var velocity = Vector2.ZERO

var SPEED = 625

func _process(delta):
	var relative_speed = velocity.length() / SPEED
	self.modulate.a = relative_speed

func _physics_process(delta):
	var input_velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if (input_velocity != Vector2.ZERO):
		velocity = self.move_and_slide(input_velocity * SPEED)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.07)
