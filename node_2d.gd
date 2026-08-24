extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_sfx: AudioStreamPlayer2D = $HitSFX

func _ready() -> void:
	sprite_2d.show()
	animated_sprite_2d.hide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		sprite_2d.hide()
		animated_sprite_2d.show()
		animated_sprite_2d.frame = 0
		animated_sprite_2d.play()
		hit_sfx.play()

func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.hide()
	sprite_2d.show()
