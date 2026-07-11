extends Area2D

@onready var big_1: CollisionShape2D = $Big1
@onready var big_2: CollisionShape2D = $Big2
@onready var big_3: CollisionShape2D = $Big3
@onready var small_1: CollisionShape2D = $Small1
@onready var small_2: CollisionShape2D = $Small2
@onready var small_3: CollisionShape2D = $Small3
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var speed = 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.stop()
	startup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	
	if position.x < -100:
		gobackstart()
		
func gobackstart() -> void:
	position.x = 1200
	var random_costume = randi() % 6
	animated_sprite_2d.frame = random_costume
	
# turn off collisions
	big_1.set_deferred("disabled", true)
	big_2.set_deferred("disabled", true)
	big_3.set_deferred("disabled", true)
	small_1.set_deferred("disabled", true)
	small_2.set_deferred("disabled", true)
	small_3.set_deferred("disabled", true)

	if random_costume == 0:
		big_1.set_deferred("disabled", false)
		
	elif random_costume == 1:
		big_2.set_deferred("disabled", false)
		
	elif random_costume == 2:
		big_3.set_deferred("disabled", false)
		
	elif random_costume == 3:
		small_1.set_deferred("disabled", false)
		
	elif random_costume == 4:
		small_2.set_deferred("disabled", false)
		
	elif random_costume == 5:
		small_3.set_deferred("disabled", false)


func startup() -> void:
	var random_costume = randi() % 6
	animated_sprite_2d.frame = random_costume
	
# turn off collisions
	big_1.set_deferred("disabled", true)
	big_2.set_deferred("disabled", true)
	big_3.set_deferred("disabled", true)
	small_1.set_deferred("disabled", true)
	small_2.set_deferred("disabled", true)
	small_3.set_deferred("disabled", true)

	if random_costume == 0:
		big_1.set_deferred("disabled", false)
		
	elif random_costume == 1:
		big_2.set_deferred("disabled", false)
		
	elif random_costume == 2:
		big_3.set_deferred("disabled", false)
		
	elif random_costume == 3:
		small_1.set_deferred("disabled", false)
		
	elif random_costume == 4:
		small_2.set_deferred("disabled", false)
		
	elif random_costume == 5:
		small_3.set_deferred("disabled", false)
