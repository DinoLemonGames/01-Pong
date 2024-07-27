extends Label

var text_size = 45

var grab_rally : int

# Setup variables for the circular motion
const STARTING_X = 475
const STARTING_Y = 18
var center = Vector2(STARTING_X, STARTING_Y)
# Radius that the circle should cover
var radius = 2.5
# Initial angle of the circle
var angle = 0
var speed = 1 # 2

# Setup variables for the rotation motion
# Initial rotation angle
var rotation_angle = 0
var rotation_speed = 1 # 2
var rotation_amplitude = 0.08 # 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_horizontal_alignment(HORIZONTAL_ALIGNMENT_CENTER)
	set_vertical_alignment(VERTICAL_ALIGNMENT_CENTER)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Float around
	# Increase the angle over time
	angle += speed * delta
	position.x = center.x + radius * cos(angle)
	position.y = center.y + radius * sin(angle)
	
	# Make the Particles follow the text
	$"../CPUParticles2D".position.x = position.x+40
	$"../CPUParticles2D".position.y = position.y+50
	
	# Update the rotation of the label left and right
	rotation_angle += rotation_speed * delta
	rotation = rotation_amplitude * sin(rotation_angle)
	
	# Lerp back to the original size of text
	label_settings.font_size = lerp(label_settings.font_size, text_size, 0.02)
	
	set_text(str($"..".rally))
	grab_rally = $"..".rally
	
	# Reset the particles when the rally starts
	if grab_rally == 0:
		$"../CPUParticles2D".speed_scale = 0.1
		$"../CPUParticles2D".emission_sphere_radius = 15
		$"../CPUParticles2D".scale_amount_min = lerpf($"../CPUParticles2D".scale_amount_min, 0.25, 0.05)
		$"../CPUParticles2D".scale_amount_max = lerpf($"../CPUParticles2D".scale_amount_min, 0.5, 0.05)
		$"../CPUParticles2D".lifetime = 0.25
		speed = 1
		rotation_speed = 1
		rotation_amplitude = 0.08
		label_settings.font_size = 45
		text_size = 45
		center = Vector2(STARTING_X, STARTING_Y)
		position = center
