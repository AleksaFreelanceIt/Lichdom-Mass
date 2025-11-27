extends Node
class_name State

@export var animation_player: AnimatedSprite2D
var state_machine: StateMachine
var player_node

func enter():
	player_node = get_parent().get_parent()
	print(player_node.name)
	

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass

func handle_input(event: InputEvent):
	pass
