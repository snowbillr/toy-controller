extends Node2D

onready var x = $X
onready var square = $Square
onready var triangle = $Triangle
onready var circle = $Circle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_icon(button):
	match button:
		ButtonType.X:
			x.show_icon()
		ButtonType.SQUARE:
			square.show_icon()
		ButtonType.TRIANGLE:
			triangle.show_icon()
		ButtonType.CIRCLE:
			circle.show_icon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
