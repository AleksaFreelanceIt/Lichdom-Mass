extends State
class_name FallState

@export var WallCheck: ShapeCast2D
@export var FloorCheck: RayCast2D

func enter():
	super()
	print("Entering fall state")
	var character = state_machine.get_parent()
	animation_player.play("JumptoFall")

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	character.velocity.y += character.fall_force * delta
	
	var direction = Input.get_axis("Left","Right")
	if(direction == 1):
		animation_player.flip_h = false
	elif(direction == -1):
		animation_player.flip_h = true;
	character.velocity.x = direction * 200
	
	character.move_and_slide()
	
	if WallCheck.is_colliding() and not FloorCheck.is_colliding() and character.velocity.y ==0:
		state_machine.change_state("Hang")
		return
		
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("Walk")
		else:
			state_machine.change_state("Idle")
func handle_input(event: InputEvent):
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	animation_player.play("Fall")
