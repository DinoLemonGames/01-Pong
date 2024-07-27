extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	set_horizontal_alignment(HORIZONTAL_ALIGNMENT_RIGHT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str($"..".right_score))
	
	# Lerp back to the original size of text
	label_settings.font_size = lerp(label_settings.font_size, 56, 0.02)
