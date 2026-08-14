extends RigidBody2D

static var bricks_count: int = 0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

# brick is hit
func hit():
	$Sprite2D.visible = false 
	$CollisionShape2D.disabled = true 
	
	bricks_count += 1
	
	if bricks_count >= 5:
		if Global.minigames_done > 2:
			bricks_count = 0 
			get_tree().change_scene_to_file("res://done_screen.tscn")
	else:
		if bricks_count >= 5:
			get_tree().change_scene_to_file("res://level_scene.tscn")
