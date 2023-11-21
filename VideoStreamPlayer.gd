extends VideoStreamPlayer

func _on_finished():
	get_tree().change_scene_to_file("res://MAIN MENU/main.tscn")
