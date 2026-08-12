extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	randomize()
	randomize_garlic_positions()
	
	await themed_timer.Timer(Global.first_game_time)
	#after this is completed...
	timer_end = true 


func _process(delta: float) -> void:
	if buttons_pressed == 5:
		if Global.minigames_done > 10:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://level_scene.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://level_scene.tscn")


func randomize_garlic_positions() -> void:
	var screen_size = get_viewport_rect().size
	var garlics = [$Button_1, $Button_2, $Button_3, $Button_4, $Button_5]
	var margin = 80 
	
	for garlic in garlics:
		if garlic:
			var random_x = randf_range(margin, screen_size.x - margin)
			var random_y = randf_range(margin, screen_size.y - margin)
			garlic.global_position = Vector2(random_x, random_y)
