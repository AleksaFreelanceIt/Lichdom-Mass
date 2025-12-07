extends State
class_name HangState

var can_transition = false

func enter():
	super()
	print("Entering hang state")
	animation_player.play("LedgeGrab")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass
	
func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	elif Input.is_action_pressed("Crouch"):
		state_machine.change_state("Fall")
