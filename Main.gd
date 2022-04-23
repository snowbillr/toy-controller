extends Node2D


onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

enum Button { X, SQUARE, TRIANGLE, CIRCLE }

var soundpacks = {
	Button.X: preload("res://assets/sound_packs/x.tres"),
	Button.SQUARE: preload("res://assets/sound_packs/square.tres"),
	Button.TRIANGLE: preload("res://assets/sound_packs/triangle.tres"),
	Button.CIRCLE: preload("res://assets/sound_packs/circle.tres"),
}

func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_pressed("circle")):
		_play_sound(Button.CIRCLE)
	if (Input.is_action_just_pressed("square")):
		_play_sound(Button.SQUARE)
	if (Input.is_action_just_pressed("x")):
		_play_sound(Button.X)
	if (Input.is_action_just_pressed("triangle")):
		_play_sound(Button.TRIANGLE)

func _play_sound(button):
	if audio_stream_player.playing:
		return
	
	audio_stream_player.stream = soundpacks[button].pick()
	audio_stream_player.play()
