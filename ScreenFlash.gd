extends ColorRect

onready var animation_player: AnimationPlayer = $AnimationPlayer

var colors = {
	ButtonType.X: Color(0.49, 0.706, 0.914, 1),
	ButtonType.SQUARE: Color(1.0, 0.412, 0.973, 1),
	ButtonType.TRIANGLE: Color(0.251, 0.886, 0.627, 1),
	ButtonType.CIRCLE: Color(1.0, 0.4, 0.4, 1)
}

func flash(button):
	randomize()
	self.modulate = colors[button]
	animation_player.play("flash")
	
