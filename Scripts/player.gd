extends CharacterBody2D

class_name Player

@export var SPEED = 62.5
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction = 0
var interact = Callable()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("interact") and interact.is_valid():
		interact.call(self)
		
	var direction_x = 0
	var direction_y = 0
	
	if Input.is_action_pressed("move_left"):
		animated_sprite.play("walk_left")
		direction_x = -1
		direction = 1
	elif Input.is_action_pressed("move_right"):
		animated_sprite.play("walk_right")
		direction_x = 1
		direction = 0	
	
	if Input.is_action_pressed("move_up"):
		direction_y = -1
		if !direction_x:
			animated_sprite.play("walk_up")
			direction = 2
	elif Input.is_action_pressed("move_down"):
		direction_y = 1
		if !direction_x:
			animated_sprite.play("walk_down")
			direction = 3
			
	
	if direction_x:
		velocity.x = direction_x * SPEED 
	else:
		if direction == 0: 
			animated_sprite.play("idle_right")
		elif direction == 1:
			animated_sprite.play("idle_left")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		if direction == 2: 
			animated_sprite.play("idle_up")
		elif direction == 3:
			animated_sprite.play("idle_down")
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
