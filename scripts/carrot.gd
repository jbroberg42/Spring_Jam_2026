extends AnimatedSprite2D
@onready var carrot = $"."


func _process(delta):
	if Input.is_action_just_pressed("switch"):
		carrot.play("Resurection")
		
		
