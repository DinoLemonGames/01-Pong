extends CharacterBody2D

const STARTING_VELOCITY = 300
const STARTING_SPEED = 1
var speed = STARTING_SPEED

#Choose "left" or "right"
var dir_x_decide = randi_range(0, 1)
var dir_y = 0
var dir_x = 0

#Stores the KinematicCollision2D when it bounces off of something
var collision_info

func _ready():
	position.x = 512
	position.y = 278
	
	speed = STARTING_SPEED
	
	# 0 is RIGHT
	if dir_x_decide == 0:
		dir_x = STARTING_VELOCITY
	# 1 is LEFT
	else:
		dir_x = -STARTING_VELOCITY
	
	# Setup the starting Y Direction
	dir_y = randi_range(-100, 100)
	
	#Set the starting velocity
	velocity = Vector2(dir_x, dir_y)

func _physics_process(delta):
	# Grab the KinematicCoollision2D when colliding
	collision_info = move_and_collide(velocity * delta * speed)
	# If colliding with the paddles
	if collision_info:
		if collision_info.get_collider() == $"../paddle_left" or collision_info.get_collider() == $"../paddle_right":
			#print(collision_info)
			$"..".rally += 1
			# Speed up the ball
			speed += 0.05
		# If colliding with anything
		# Angle the ball's Y
		velocity.y += randf_range(-100, 100)
		# Bounce off of the object
		velocity = velocity.bounce(collision_info.get_normal())
