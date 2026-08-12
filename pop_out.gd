extends RichTextLabel
signal popped_in_done
var popped_in = false

func _ready() -> void:
	visible = false 
	await pop_out()
	await get_tree().create_timer(2.0).timeout
	pop_in()

func pop_out():
	await get_tree().process_frame 
	
	scale = Vector2(0.1, 0.1)
	modulate.a = 0.0
	pivot_offset = size / 2
	visible = true
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.15)
	tween.tween_property(self, "modulate:a", 1.0, 0.1)
	await tween.finished
	
	var settle = create_tween()
	settle.tween_property(self, "scale", Vector2(1.0, 1.0), 0.08)
func pop_in() -> void:
	pivot_offset = size / 2
	
	var wind_up = create_tween()
	wind_up.tween_property(self, "scale", Vector2(1.2, 1.2), 0.08)
	await wind_up.finished
	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "scale", Vector2(0.1, 0.1), 0.15)
	tween.tween_property(self, "modulate:a", 0.0, 0.15)
	await tween.finished
	visible = false
	popped_in_done.emit()
	var popped_in = true
