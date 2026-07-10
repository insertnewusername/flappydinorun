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
			global_position.y = randf_range(200.0, 500.0)
			


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "bird":
		body.die()


func _on_area_2d_2_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
