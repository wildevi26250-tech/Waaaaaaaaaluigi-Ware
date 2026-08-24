extends Node2D

@onready var beat_player: AudioStreamPlayer2D = $BeatPlayer

var sequence_pattern: Array[float] = [0.3, -0.4, 0.2, 0.1]
var target_timestamps: Array[float] = []
var listening_phase: bool = false

var phase_start_time: int = 0 
var matched_indices: Array[int] = []
var missed_any: bool = false

const TOLERANCE: float = 0.18

func _ready() -> void:
	start_simon_says()

func start_simon_says() -> void:
	listening_phase = false
	target_timestamps.clear()
	matched_indices.clear()
	missed_any = false
	print("listen up")
	await get_tree().create_timer(1.0).timeout
	play_cpu_sequence()

func play_cpu_sequence() -> void:
	var accumulated_time: float = 0.0
	for delay in sequence_pattern:
		var absolute_delay = abs(delay)
		accumulated_time += absolute_delay
		await get_tree().create_timer(absolute_delay).timeout
		if delay > 0:
			target_timestamps.append(accumulated_time)
			beat_player.play()
	
	await get_tree().create_timer(0.8).timeout
	start_player_phase()

func start_player_phase() -> void:
	print("--- YOUR TURN: Repeat the rhythm! ---")
	phase_start_time = Time.get_ticks_usec()
	listening_phase = true

func _input(event: InputEvent) -> void:
	if not listening_phase:
		return
		
	if event.is_action_pressed("ui_accept"):
		var system_now = Time.get_ticks_usec()
		var actual_time_seconds = (system_now - phase_start_time) / 1000000.0
		
		beat_player.play()
		check_closest_beat(actual_time_seconds)

func check_closest_beat(actual_time: float) -> void:
	var closest_index: int = -1
	var smallest_difference: float = 999.0
	
	for i in range(target_timestamps.size()):
		if i in matched_indices:
			continue
		var diff = abs(actual_time - target_timestamps[i])
		if diff < smallest_difference:
			smallest_difference = diff
			closest_index = i
			
	if closest_index == -1:
		return

	if smallest_difference <= TOLERANCE:
		print("Beat ", closest_index + 1, " MATCHED! Error: ", smallest_difference)
		matched_indices.append(closest_index)
	else:
		print("Beat ", closest_index + 1, " MISSED! Too early/late by: ", smallest_difference)
		missed_any = true
		matched_indices.append(closest_index)

	if matched_indices.size() >= target_timestamps.size():
		end_round()

func end_round() -> void:
	listening_phase = false
	if missed_any:
		print("You Lost!")
	else:
		print("You Won!")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://level_scene.tscn")
