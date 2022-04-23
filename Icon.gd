extends Sprite

onready var animation_player: AnimationPlayer = $AnimationPlayer

var textures = {
	ButtonType.X: preload("res://assets/icons/x.svg"),
	ButtonType.SQUARE: preload("res://assets/icons/square.svg"),
	ButtonType.TRIANGLE: preload("res://assets/icons/triangle.svg"),
	ButtonType.CIRCLE: preload("res://assets/icons/circle.svg"),
}


func show_icon(button_type):
	animation_player.stop(true);

	self.texture = textures[button_type]
	
	self.show()
	animation_player.play("show")
	yield(animation_player, "animation_finished")
	self.hide()
