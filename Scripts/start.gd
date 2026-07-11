extends Node2D
@onready var fade_transition: ColorRect = $Fade_transition
@onready var fade_timer: Timer = $Fade_transition/Fade_timer

var gameno = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func flappybird():
		$Fade_transition.show()
		$Fade_transition/Fade_timer.start()
		$Fade_transition/AnimationPlayer.play("fade_out")
		gameno = 1	
	
		


func _on_fade_timer_timeout() -> void:
	if gameno == 0:
		$Fade_transition.hide()
	elif gameno == 1:
		get_tree().change_scene_to_file("res://Sprites/flappybird.tscn")
