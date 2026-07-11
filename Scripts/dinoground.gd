extends StaticBody2D

const SPEED = -400
var screen_width: float
func _ready() -> void:
	screen_width = get_viewport_rect().size.x
	print (screen_width)
func _physics_process(delta: float) -> void:

		global_position.x += SPEED * delta
		
		if global_position.x < -500:
		# Teleport it back to the right side of the screen
			global_position.x = screen_width + 621
			
