extends Node2D

onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
onready var icons = $Icons

var soundpacks = {
	ButtonType.X: preload("res://assets/sound_packs/x.tres"),
	ButtonType.SQUARE: preload("res://assets/sound_packs/square.tres"),
	ButtonType.TRIANGLE: preload("res://assets/sound_packs/triangle.tres"),
	ButtonType.CIRCLE: preload("res://assets/sound_packs/circle.tres"),
}

func _process(delta):
	if (Input.is_action_just_pressed("circle")):
		_play_sound(ButtonType.CIRCLE)
		icons.show_icon(ButtonType.CIRCLE)
	if (Input.is_action_just_pressed("square")):
		_play_sound(ButtonType.SQUARE)
		icons.show_icon(ButtonType.SQUARE)
	if (Input.is_action_just_pressed("x")):
		_play_sound(ButtonType.X)
		icons.show_icon(ButtonType.X)
	if (Input.is_action_just_pressed("triangle")):
		_play_sound(ButtonType.TRIANGLE)
		icons.show_icon(ButtonType.TRIANGLE)

func _play_sound(button):
	if audio_stream_player.playing:
		return
	
	audio_stream_player.stream = soundpacks[button].pick()
	audio_stream_player.play()
