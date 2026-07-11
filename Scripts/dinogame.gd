extends Node2D
@onready var fade_transition: ColorRect = $Fade_transition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fade_timer_timeout() -> void:
	$Fade_transition.hide()
