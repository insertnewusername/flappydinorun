extends CharacterBody2D


const SPEED = -200.0
var screen_width: float

func _ready() -> void:
	screen_width = get_viewport_rect().size.x

func _physics_process(delta: float) -> void:

		velocity.x = SPEED

		move_and_slide()
		
		if global_position.x < -50:
		# Teleport it back to the right side of the screen
			global_position.x = screen_width + 50
