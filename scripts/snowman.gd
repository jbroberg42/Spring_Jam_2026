extends Node2D

const speed = 60

var direction = 1
#var carrot = preload("res://scenes/carrot.tscn")
var is_carrot
@onready var timer = $Timer

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	is_carrot = false

func _process(delta):
	if Input.is_action_just_pressed("switch"):
#		var instance = carrot.instantiate()
#		instance.position = Vector2(position.x, position.y-10)
#		add_sibling(instance)
#		queue_free()
		if !is_carrot:
			is_carrot = !is_carrot
			$killzone/CollisionShape2D.disabled = true
			animated_sprite_2d.play("Melts")
		else:
			animated_sprite_2d.play("resurrects")
			timer.start() #the timer below will trigger and turn the snowman hostile again
		
		
	if !is_carrot:
		if not ray_cast_right.is_colliding():
			direction = -1
			animated_sprite_2d.flip_h = false
		if not ray_cast_left.is_colliding():
			direction = 1
			animated_sprite_2d.flip_h = true
		position.x += direction * speed * delta


func _on_timer_timeout() -> void:
	is_carrot = !is_carrot
	animated_sprite_2d.play("default")
	$killzone/CollisionShape2D.disabled = false
