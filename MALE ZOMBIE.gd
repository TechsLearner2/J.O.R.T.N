extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var SPEED = 175
var player
var chase = false

func _physics_process(delta):
	# GRAVITY FOR ZOMBIE
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "DEAD":
			get_node("AnimatedSprite2D").play("WALK")
		player = get_node("../../Rizer/RIZER THE NINJA")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "DEAD":
			get_node("AnimatedSprite2D").play("IDLE")
		velocity.x = 0
	move_and_slide()
		
func _on_rizer_detection_body_entered(body):
	if body.name == "RIZER THE NINJA":
			chase = true

func _on_rizer_detection_body_exited(body):
	if body.name == "RIZER THE NINJA":
			chase = false


func _on_rizer_death_body_entered(body):
	if body.name == "RIZER THE NINJA":
		chase = false
		death()


func _on_rizer_collision_body_entered(body):
	if body.name == "RIZER THE NINJA":
		body.health -= 3
		chase = false
		death()
		
func death():
	chase = false
	get_node("AnimatedSprite2D").play("DEAD")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
