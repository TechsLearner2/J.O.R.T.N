extends VideoStreamPlayer


var loop = true


func _on_finished():
	if loop:
		play()
