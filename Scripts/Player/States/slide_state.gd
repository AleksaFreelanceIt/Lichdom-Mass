extends State
class_name SlideState

@export var slide_initial_speed: float = 600
@export var slide_stop: float = 200
@export var slide_deceleration: float
func enter():
	print("Entering slide state")
	var character = state_machine.get_parent()
	
	# Set initial slide velocity
	var current_direction = sign(character.velocity.x)
	if current_direction == 0:
		current_direction = 1 if character.facing_right else -1
	
	character.velocity.x = slide_initial_speed * current_direction

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	
	# Usporenje
	character.velocity.x = move_toward(character.velocity.x, slide_stop, slide_deceleration * delta)
	
	# Check for state transitions only when slide is complete
	if abs(character.velocity.x) <= slide_stop:  # Small threshold
		if character.is_on_floor():
			if direction != 0:
				state_machine.change_state("Sprint")
			else:
				state_machine.change_state("Crouch")
		else:
			state_machine.change_state("Fall")
	
	# Handle falling during slide
	if !character.is_on_floor() and character.velocity.y > 0:
		state_machine.change_state("Fall")
	
	character.move_and_slide()
