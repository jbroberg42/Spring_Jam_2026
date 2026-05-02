extends Node

var score: int = 0
var level: int = 1
var time_taken: int = 0
var is_winter: bool = true

var ability_cooldown: int = 5
var ability_ready: bool = true

var have_ring: bool = false
	
func reset():
	score = 0
	level = 0
	time_taken = 0
	is_winter = true
	have_ring = false
	ability_ready = true
	get_tree().reload_current_scene()
