extends State
class_name WalkState

func enter():
	print("Entering Walk State")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	
	if direction ==0:
		state_machine.change_state("Idle")
		return
	character.velocity.x = direction * 200
	character.move_and_slide()
	if character.velocity.y > 0:
		state_machine.change_state("Fall")

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	elif Input.is_action_pressed("Sprint"):
		state_machine.change_state("Sprint")
