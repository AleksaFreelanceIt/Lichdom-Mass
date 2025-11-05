extends PlayerState

func handle_input(_delta):
	var direction = Input.get_axis("Left","Right");
	if direction != 0:
		player.velocity.x = direction * player.SPEED;
	else:
		player.change_state("Idle");
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.change_state("Jump");
	elif Input.is_action_pressed("Crouch") and player.is_on_floor():
		player.change_state("Crouch");
	
