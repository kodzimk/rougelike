@abstract
class_name Interactable
extends Node2D

@abstract func interact(player: CharacterBody2D) -> void
@export var label : Label
@export var sprite: AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
		label.visible = true
		(body as Player).interact = interact

func _on_body_exited(body: Node2D) -> void:
		label.visible = false
		(body as Player).interact = Callable()
