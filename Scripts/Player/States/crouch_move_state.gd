extends State
class_name CrouchWalkState

func enter():
	super()
	animation_player.play("CrouchMove")
	print("Entering CrouchWalk State")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("Left","Right")
	if(direction == 1):
		animation_player.flip_h = false
	elif(direction == -1):
		animation_player.flip_h = true;
	elif direction == 0 and (Input.is_action_just_released("Left") or Input.is_action_just_released("Right")):
		state_machine.change_state("Crouch")
		return
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
	character.velocity.x = direction * player_node.walk_speed/2
	character.move_and_slide()

func handle_input(event: InputEvent):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state("Jump")
	elif Input.is_action_just_released("Crouch"):
		state_machine.change_state("Walk")
