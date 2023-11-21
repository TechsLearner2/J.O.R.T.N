extends ParallaxBackground


func _on_give_up_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://intro.tscn")


	
