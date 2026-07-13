extends CharacterBody2D
@onready var label: Label = $"../Control2/Panel/Label"
@onready var jump: AudioStreamPlayer2D = $"../Jump"
@onready var point: AudioStreamPlayer2D = $"../Point"
@onready var dies: AudioStreamPlayer2D = $"../Die"

var immune = 0
var stop = 0
var onfloor = 0

const JUMP_VELOCITY = -230.0
var score = 0
func _ready() -> void:
	label.text = "Hi: %d   Score: %d" % [Global.hiscore, score]
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and onfloor < 2:
		velocity.y = JUMP_VELOCITY
		if Global.volume == 1:
			jump.play()
		onfloor += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor():
		onfloor = 0
	move_and_slide()

func addscore():
	if stop == 1:
		return
		if Global.volume == 1:
			point.play()
	score += 1
	if score > Global.hiscore:
		Global.hiscore = score
	label.text = "Hi: %d   Score: %d" % [Global.hiscore, score]

func die():
	stop = 1
	if immune == 0:
		if Global.volume == 1:
			dies.play()
		else:
			_on_die_finished()
	
func reload():
	get_tree().reload_current_scene()
	
func immunity():
	immune += 1

func _on_die_finished() -> void:
	call_deferred("reload") 
