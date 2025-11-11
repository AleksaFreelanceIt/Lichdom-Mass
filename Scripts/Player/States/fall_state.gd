extends State
class_name FallState

@export var fall_force: float = 900

func enter():
	print("Entering fall state")
	var character = state_machine.get_parent()

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	character.velocity.y += fall_force * delta
	
	var direction = Input.get_axis("Left","Right")
	character.velocity.x = direction * 200
	
	character.move_and_slide()
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("Walk")
		else:
			state_machine.change_state("Idle")
func handle_input(event: InputEvent):
	pass
