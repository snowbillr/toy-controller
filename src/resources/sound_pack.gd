extends Resource
class_name SoundPack

export(Array, AudioStreamOGGVorbis) var sounds = []


func _ready():
	pass # Replace with function body.


func size():
	return sounds.size()


func pick():
	return sounds[(rand_range(0, sounds.size()))]	
