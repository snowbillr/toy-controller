extends Sprite

onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func show_icon():
	self.show()
	animation_player.play("show")
	yield(animation_player, "animation_finished")
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
