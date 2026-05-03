extends Node
	
var score: int = 0
var level: int = 0
var time_taken: int = 0
var is_winter: bool = false

const ABILITY_COOLDOWN: int = 1

const LEVEL_COLORS: Array[String] = [
	"ruby",
	"topaz",
	"emerald",
	"blue",
	"indigo",
	"pink",
	"silver"
]

var ability_ready: bool = true

var have_macguffin: bool = false

const LEVEL_LIST: Array[String] = [
	"res://scenes/levels/level_1.tscn",
	"res://scenes/levels/level2.tscn"
	]
	
func reset_level():
	get_tree().reload_current_scene()
	have_macguffin = false
	ability_ready = true
	is_winter = false
	
func reset_game():
	score = 0
	level = 0
	is_winter = false
	have_macguffin = false
	ability_ready = true
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
	
