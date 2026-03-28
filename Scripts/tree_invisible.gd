extends Area2D

@export var tilemap: TileMap
@export var highlight_color: Color = Color(1, 0, 0, 0.5) 
@export var normal_color : Color = Color(1, 0, 0, 0.5) 

func _on_body_entered(body: Node2D) -> void:
	print("entered")
	tilemap.modulate = highlight_color


func _on_body_exited(body: Node2D) -> void:
	tilemap.modulate = normal_color
