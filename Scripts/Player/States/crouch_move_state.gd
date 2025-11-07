extends State
class_name CrouchWalkState

func enter():
	print("Entering CrouchWalk State")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	
	if direction ==0:
		state_machine.change_state("Crouch")
		return
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
	character.velocity.x = direction * 100
	character.move_and_slide()

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	elif Input.is_action_just_released("Crouch"):
		state_machine.change_state("Walk")
