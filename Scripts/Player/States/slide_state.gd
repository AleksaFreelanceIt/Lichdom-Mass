extends State
class_name SlideState

func enter():
	super()
	animation_player.play("Slide")
	print("Entering slide state")
	var character = state_machine.get_parent()
	
	# Set initial slide velocity
	var current_direction = sign(character.velocity.x)
	if current_direction == 0:
		current_direction = 1 if character.facing_right else -1
	
	character.velocity.x = player_node.slide_force * current_direction

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	
	# Usporenje
	character.velocity.x = move_toward(character.velocity.x, player_node.slide_stop, player_node.slide_deceleration * delta)
	if !character.is_on_floor():
			character.velocity.y += character.fall_force * delta
	# Check for state transitions only when slide is complete
	if abs(character.velocity.x) <= player_node.slide_stop:  # Small threshold
		if character.is_on_floor():
			if direction != 0:
				state_machine.change_state("Sprint")
			else:
				state_machine.change_state("Crouch")
		else:
			state_machine.change_state("Fall")
	
	
	
	character.move_and_slide()
