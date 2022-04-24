extends Node2D

onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
onready var icon: Sprite = $Icon
onready var screen_flash: ColorRect = $ScreenFlash
onready var cursor: KinematicBody2D = $Cursor


var soundpacks = {
	ButtonType.X: preload("res://assets/sound_packs/x.tres"),
	ButtonType.SQUARE: preload("res://assets/sound_packs/square.tres"),
	ButtonType.TRIANGLE: preload("res://assets/sound_packs/triangle.tres"),
	ButtonType.CIRCLE: preload("res://assets/sound_packs/circle.tres"),
}

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
			OS.window_fullscreen = !OS.window_fullscreen

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
		
	if button_type != null and !audio_stream_player.playing:
		_play_sound(button_type)
		icon.show_icon(button_type)
		screen_flash.flash(button_type)



func _play_sound(button):
	audio_stream_player.stream = soundpacks[button].pick()
	audio_stream_player.play()
