extends Node

var minigames_done = 0 
var lives = 5 
var first_game_time: float = 16.0
var time_minus: float = 0.5
var min_game_time: float = 7.0

func increase_speed() -> void:
	minigames_done += 1
	first_game_time = max(min_game_time, first_game_time - time_minus)
	
