extends Node

@onready var score: Control = $"../HUD/Control/VBoxContainer/Score/Label"

signal winter
signal spring

func add_score(amount: int):
	GameState.score += amount
	score.text = str(GameState.score)
	
func load_next_level():
	GameState.have_macguffin = false
	get_tree().change_scene_to_file(GameState.LEVEL_LIST[GameState.level + 1])
	GameState.level += 1
	spring.emit()
	GameState.is_winter = false
	
func switch_seasons():
	GameState.is_winter = !GameState.is_winter
	print("here")
	if GameState.is_winter:
		winter.emit()
	else:
		spring.emit()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = str(GameState.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
