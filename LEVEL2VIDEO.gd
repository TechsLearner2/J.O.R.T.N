extends VideoStreamPlayer

var loop = false


func _on_finished():
	if loop:
		play()
