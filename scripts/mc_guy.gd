extends Node2D

const speed = 60

var direction = 1
var carrot = preload("res://scenes/carrot.tscn")
@onready var timer = $Timer

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _process(delta):
	if Input.is_action_just_pressed("switch"):
		var instance = carrot.instantiate()
		instance.position = Vector2(position.x, position.y-10)
		add_sibling(instance)
		queue_free()
		
		
	if not ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
	if not ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	position.x += direction * speed * delta
