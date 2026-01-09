extends State
class_name HangState

var can_transition = false
@export var hang_check: CollisionShape2D

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
		hang_check.disabled = true
		state_machine.change_state("Fall")
		await get_tree().create_timer(0.1).timeout
		hang_check.disabled = false
