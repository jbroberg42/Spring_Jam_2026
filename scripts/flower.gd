extends Node2D
@onready var anim = $AnimatedSprite2D
@onready var timer = $Area2D/Timer
@onready var timer_2 = $Area2D/Timer2
@onready var timer_3 = $Area2D/Timer3
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D

var readyattack = true

func _ready():
	$killzone/CollisionShape2D.disabled = true
	

func _on_area_2d_body_entered(body):
	if readyattack == true:
		readyattack = false
		anim.play("attack")
		timer.start()
	
	
func _on_timer_timeout():
	$killzone/CollisionShape2D.disabled = false
	collision_shape_2d.disabled = true
	timer_2.start()


func _on_timer_2_timeout():
	$killzone/CollisionShape2D.disabled = true
	timer_3.start()
	


func _on_timer_3_timeout():
	collision_shape_2d.disabled = false
	anim.play("idle")
	readyattack = true
