extends Node2D
@onready var fade_transition: ColorRect = $Fade_transition
var backhomes = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade_transition/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_fade_timer_timeout() -> void:
	$Fade_transition.hide()
	if backhomes == 1:
		get_tree().change_scene_to_file("res://Sprites/Start.tscn")
	
func backhome() -> void:
	backhomes += 1
	print(backhomes)
	$Fade_transition/Fade_timer.start()
	$Fade_transition.show()
	$Fade_transition/AnimationPlayer.play("fade_out")
	
	
