extends Node2D

@onready var game_manager: Node = %GameManager

const speed = 60
var direction = 1
#var carrot = preload("res://scenes/carrot.tscn")
var is_carrot
@onready var timer = $Timer

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_bottom_right: RayCast2D = $RayCastBottomRight
@onready var ray_cast_bottom_left: RayCast2D = $RayCastBottomLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	is_carrot = false
	#connect signals with code.  Otherwise you have to connect each mob manually.  Which sucks.
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)

func _process(delta):
#	if Input.is_action_just_pressed("switch"):
#		var instance = carrot.instantiate()
#		instance.position = Vector2(position.x, position.y-10)
#		add_sibling(instance)
#		queue_free()
		#if !is_carrot:
			#is_carrot = !is_carrot
			#$killzone/CollisionShape2D.disabled = true
			#animated_sprite_2d.play("Melts")
		#else:
			#animated_sprite_2d.play("resurrects")
			#timer.start() #the timer below will trigger and turn the snowman hostile again
		
	#move side to side, not off cliff or through walls
	#RayCastRight and RayCastLeft detect walls, the Bottom ones detect cliffs
	if !is_carrot:
		if ray_cast_right.is_colliding() || not ray_cast_bottom_right.is_colliding():
			direction = -1
			animated_sprite_2d.flip_h = false
		if ray_cast_left.is_colliding() || not ray_cast_bottom_left.is_colliding():
			direction = 1
			animated_sprite_2d.flip_h = true
		position.x += direction * speed * delta

#timer for snowman resurrection.  snowman will not hurt you until regeneration is complete
func _on_timer_timeout() -> void:
	is_carrot = false
	animated_sprite_2d.play("default")
	$killzone/CollisionShape2D.disabled = false

#when game manager says is spring, turn into carrot
func _on_game_manager_spring() -> void:
		is_carrot = true
		$killzone/CollisionShape2D.disabled = true
		animated_sprite_2d.play("Melts")
		
#when game manager says is winter, ressurect
func _on_game_manager_winter() -> void:
	animated_sprite_2d.play("resurrects")
	timer.start() #the timer will trigger and turn the snowman hostile again
