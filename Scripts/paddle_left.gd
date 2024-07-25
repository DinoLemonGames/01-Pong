extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	position.x = 34
	
	var direction = Input.get_axis("left_paddle_up", "left_paddle_down")
	if direction:
		velocity.y = direction * SPEED
	else:
					#Changing velocity.y to end up at 0, by a rate of SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)	

	#Makes the player move with the velocity
	move_and_slide()
