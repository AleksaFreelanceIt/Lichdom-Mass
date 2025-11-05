extends PlayerState

func enter_state(player_node):
	super(player_node);
	player.velocity.y = player.JUMP_VELOCITY;

func _handle_input(_delta):
	if player.is_on_floor() and player.velocity.x == 0:
		player.change_state("Idle");
	elif player.is_on_floor() and player.velocity.x !=0:
		player.change_state("Walk")
