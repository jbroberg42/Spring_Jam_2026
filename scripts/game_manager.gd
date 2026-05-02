extends Node

@onready var score: Control = $"../HUD/Control/VBoxContainer/Score/Label"

func add_score(amount: int):
	GameState.score += amount
	score.text = str(GameState.score)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = str(GameState.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
