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
	var button_type = null
	
	if (Input.is_action_just_pressed("circle")):
		button_type = ButtonType.CIRCLE
	if (Input.is_action_just_pressed("square")):
		button_type = ButtonType.SQUARE
	if (Input.is_action_just_pressed("x")):
		button_type = ButtonType.X
	if (Input.is_action_just_pressed("triangle")):
		button_type = ButtonType.TRIANGLE
		
	if button_type != null:
		_play_sound(button_type)
		icons.show_icon(button_type)

func _play_sound(button):
	if audio_stream_player.playing:
		return
	
	audio_stream_player.stream = soundpacks[button].pick()
	audio_stream_player.play()
