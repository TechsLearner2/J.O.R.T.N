extends ParallaxBackground

func _ready():
	$AnimatedSprite2D.play("TUTORIAL")


func _on_animated_sprite_2d_animation_finished():
	$".".visible = false
