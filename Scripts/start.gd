extends Node2D
@onready var fade_transition: ColorRect = $Fade_transition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
