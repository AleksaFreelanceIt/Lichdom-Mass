extends State
class_name SlideState

@export var slide_initial_speed: float = 600
@export var slide_stop: float = 200

func enter():
	print("Entering slide state")
	var character = state_machine.get_parent()
	if character.velocity.x > 0:
		character.velocity.x = slide_initial_speed
	else:
		character.velocity.x = -slide_initial_speed

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	print(character.velocity.x)
	if character.velocity.x > 0:
		if character.velocity.x > slide_stop:
			character.velocity.x -= 10
		else:
			state_machine.change_state("Sprint")
	else:
		if character.velocity.x < -slide_stop:
			character.velocity.x += 10
		else:
			state_machine.change_state("Sprint")
	
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
	
	character.move_and_slide()
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("Walk")
		else:
			state_machine.change_state("Idle")
func handle_input(event: InputEvent):
	pass
