extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var score_label: Label = $"../Control2/Panel/Label"
@onready var point: AudioStreamPlayer2D = $"../point"
@onready var woosh: AudioStreamPlayer2D = $"../woosh"


const JUMP_VELOCITY = 400.0
var screen_height: float
var scores = 0
var immunes = 0
func _ready() -> void:
	screen_height = get_viewport_rect().size.y
	score_label.text = "Hi: %s   Score: %s" % [Global.flappyhi, scores]
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * -1

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		woosh.play()
		animated_sprite_2d.play("flap")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
	
	if global_position.y > screen_height or global_position.y < 0:
		die()
	
func die():
	if immunes == 0:
		print("ded") 
		call_deferred("restart")	
	else:
		pass
func restart():
	get_tree().reload_current_scene()
	
func score():
	scores+= 1
	point.play()
	if scores > Global.flappyhi:
		Global.flappyhi = scores
		
	score_label.text = "Hi: %s   Score: %s" % [Global.flappyhi, scores]
	
func immune():
	immunes += 1
