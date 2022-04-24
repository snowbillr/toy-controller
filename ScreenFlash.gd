extends ColorRect

onready var animation_player: AnimationPlayer = $AnimationPlayer

func flash():
	randomize()
	self.modulate = Color.from_hsv(rand_range(0, 0.6), 0.2, 1)
	animation_player.play("flash")
	
