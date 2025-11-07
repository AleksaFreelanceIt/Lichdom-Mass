extends State
class_name IdleState

func enter():
	print("Entering idle state")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass

func handle_input(event: InputEvent):
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		state_machine.change_state("Walk")
	elif Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	pass
