extends Interactable

func interact(player: CharacterBody2D) -> void:
	print((player as Player).SPEED)
		
