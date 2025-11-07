extends State
class_name JumpState

func enter():
	var character = state_machine.get_parent()
	character.velocity.y = -400

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	character.velocity.y += 900 * delta
	
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
