extends Node

var score: int = 0
var level: int = 0
var time_taken: int = 0
var is_winter: bool = true

var ability_cooldown: int = 1
var ability_ready: bool = true

var have_ring: bool = false

var level_list: Array[String] = [
	"res://scenes/game.tscn",
	"res://scenes/level0.tscn"
	]
	
func reset():
	score = 0
	level = 0
	time_taken = 0
	is_winter = true
	have_ring = false
	ability_ready = true
	get_tree().reload_current_scene()
