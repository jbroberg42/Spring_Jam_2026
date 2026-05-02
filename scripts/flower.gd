extends Node2D
@onready var anim = $AnimatedSprite2D
	


func _on_area_2d_body_entered(body):
	anim.play("attack")
