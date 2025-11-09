extends State
class_name SprintState

func enter():
	print("Entering Sprint State")

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
	if character.velocity.y >0:
		state_machine.change_state("Fall")
	character.velocity.x = direction * 450
	character.move_and_slide()

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	if Input.is_action_just_pressed("Sprint"):
		state_machine.change_state("Walk")
	if Input.is_action_pressed("Crouch"):
		state_machine.change_state("Slide")
