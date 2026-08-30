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
	print ("hit")
	
	bricks_count += 1
	
	if bricks_count >= 5:
		print("hit 5 blocks")
		get_tree().change_scene_to_file("res://level_scene.tscn")
