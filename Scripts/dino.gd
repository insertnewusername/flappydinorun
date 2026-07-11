extends CharacterBody2D
@onready var label: Label = $"../Control2/Panel/Label"
var immune = 0

const JUMP_VELOCITY = -450.0
var score = 0
func _ready() -> void:
	label.text = "Hi: %d   Score: %d" % [Global.hiscore, score]
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()

func addscore():
	score += 1
	if score > Global.hiscore:
		Global.hiscore = score
		
	label.text = "Hi: %d   Score: %d" % [Global.hiscore, score]

func die():
	if immune == 0:
		call_deferred("reload") 
	
func reload():
	get_tree().reload_current_scene()
	
func immunity():
	immune += 1
