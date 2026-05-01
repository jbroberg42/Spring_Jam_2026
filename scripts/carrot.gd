extends AnimatedSprite2D

@onready var carrot = $"."

var snowman = preload("res://scenes/snowman.tscn")

func _process(delta):
	if Input.is_action_just_pressed("switch"):
		carrot.play("Resurection")
		var instance = snowman.instantiate()
		instance.AnimatedSprite2D.position = Vector2(position.x, position.y)
		add_sibling(instance)
		queue_free()
		
