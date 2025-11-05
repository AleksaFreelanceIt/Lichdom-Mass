extends PlayerState

func enter_state(player_node):
	super(player_node);
	player.velocity.x = 0;

func handle_input(_delta):
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.change_state("Jump");
	elif Input.get_axis("Left","Right") != 0:
		player.change_state("Walk");
	elif Input.is_action_pressed("Crouch") and player.is_on_floor():
		player.change_state("Crouch");
	
