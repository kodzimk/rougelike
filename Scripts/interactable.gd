@abstract
class_name Interactable
extends Node2D

@abstract func interact(player: CharacterBody2D) -> void
@export var label : Label
@export var sprite: AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
		sprite.modulate = Color(1.0, 1.0, 1.0, 0.39)
		label.visible = true
		(body as Player).interact = interact

func _on_body_exited(body: Node2D) -> void:
		sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
		label.visible = false
		(body as Player).interact = Callable()
		
func _on_mouse_entered() -> void:
	sprite.modulate = Color(1.0, 1.0, 1.0, 0.39)
	label.visible = true
	
func _on_mouse_exited() -> void:
	sprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
	label.visible = false
