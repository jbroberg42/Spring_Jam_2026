extends Node2D
@onready var game_manager: Node = %GameManager
@onready var anim = $AnimatedSprite2D
@onready var timer = $Area2D/Timer
@onready var timer_2 = $Area2D/Timer2
@onready var timer_3 = $Area2D/Timer3
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D

var readyattack = true

func _ready():
	# connect signals with code.  Otherwise you have to connect each mob manually.  Which sucks.
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)
	$killzone/CollisionShape2D.disabled = true
	
	# hide if starting winter, show if starting spring
	if GameState.is_winter:
		_on_game_manager_winter()
	else:
		_on_game_manager_spring()

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
	if !GameState.is_winter: # verify spring so no invisible platform in winter
		collision_shape_2d.disabled = false
	anim.play("idle")
	readyattack = true
		
# when game manager says is winter, disappear
func _on_game_manager_winter() -> void:
	hide()
	$Area2D/CollisionShape2D2.disabled = true
	$StaticBody2D/CollisionShape2D.disabled = true
	$killzone/CollisionShape2D.disabled = true
	
# when game manager says is spring, reappear
func _on_game_manager_spring() -> void:
	show()
	$Area2D/CollisionShape2D2.disabled = false
	$StaticBody2D/CollisionShape2D.disabled = false
