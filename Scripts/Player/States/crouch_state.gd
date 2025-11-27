extends State
class_name CrouchState

func enter():
	super()
	animation_player.play("Crouch")
	print("Entering Crouch State")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	if character.velocity.y > 0:
		state_machine.change_state("Fall")

func handle_input(event: InputEvent):
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		state_machine.change_state("CrouchMove")
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	elif Input.is_action_just_released("Crouch"):
		state_machine.change_state("Idle")
