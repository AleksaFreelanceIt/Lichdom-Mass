extends CharacterBody2D
const SPEED = 300.0;
const JUMP_VELOCITY = -400.0;
var current_state;
var last_facing_direction = 1; #1 desno -1 levo
@onready var player_sprite: Sprite2D = $playerSprite;

func _ready() -> void:
	change_state("Idle");

func change_state(new_state_name: String):
	if current_state:
		current_state.exit_state();
	current_state = get_node(new_state_name);
	if current_state:
		current_state.enter_state(self);

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left","ui_right");
	if direction != 0:
		last_facing_direction = sign(direction);
	if not is_on_floor():
		velocity += get_gravity() * delta;
	if current_state:
		current_state.handle_input(delta)
	move_and_slide()
	
	if direction >= 1:
		player_sprite.flip_h = false;
	elif direction <= -1:
		player_sprite.flip_h = true;
		
