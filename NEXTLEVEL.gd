extends Area2D




func _on_body_entered(body):
	if body.get_name() == "RIZER THE NINJA":
		$LEVEL5.visible = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://level_5.tscn")
