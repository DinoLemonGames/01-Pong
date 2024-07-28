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
	$"../CPUParticles2D".position.x = position.x
	$"../CPUParticles2D".position.y = position.y
	# Grab the KinematicCoollision2D when colliding
	collision_info = move_and_collide(velocity * delta * speed)
	# If colliding with the paddles
	if collision_info:
		$"../snd_ball_hit".pitch_scale = randi_range(-2, 2)
		$"../snd_ball_hit".playing = true
		if collision_info.get_collider() == $"../paddle_left" or collision_info.get_collider() == $"../paddle_right":
			$"..".rally += 1
			# Increase the crowd
			$"../snd_ambient_crowd".volume_edit += 0.8
			# Make the particle more intense
			$"../CPUParticles2D".speed_scale += 0.01
			$"../CPUParticles2D".emission_sphere_radius += 0.7
			$"../CPUParticles2D".scale_amount_max += 0.07
			$"../CPUParticles2D".scale_amount_min += 0.05
			$"../CPUParticles2D".lifetime += 0.005
			# Speed up the text floating
			#$"../rally_label".speed += 0.05
			$"../rally_label".rotation_speed += 0.01
			$"../rally_label".rotation_amplitude += 0.005
			# Make Rally Text bigger
			$"../rally_label".label_settings.font_size = $"../rally_label".text_size + 35
			$"../rally_label".text_size += 1
			#$"../rally_label".get_font(""res://Fonts/pricedown bl.otf"") = 60
			# Speed up the ball
			speed += 0.05
		# If colliding with anything
		# Angle the ball's Y
		velocity.y += randf_range(-100, 100)
		# Bounce off of the object
		velocity = velocity.bounce(collision_info.get_normal())
