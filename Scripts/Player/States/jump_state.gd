extends State
class_name JumpState

@export var jump_force: float = -100
@export var gravity: float = 500
func enter():
	super()
	print("Entering jump state")
	var character = state_machine.get_parent()
	character.velocity.y = jump_force
	animation_player.play("Jump")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	print(character.velocity.y)
	character.velocity.y += gravity*delta
	
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
	
	var direction = Input.get_axis("Left","Right")
	if(direction == 1):
		animation_player.flip_h = false
	elif(direction == -1):
		animation_player.flip_h = true;
	character.velocity.x = direction * 200
	
	character.move_and_slide()
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("Walk")
		else:
			state_machine.change_state("Idle")
func handle_input(event: InputEvent):
	pass
