extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	set_horizontal_alignment(HORIZONTAL_ALIGNMENT_LEFT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str($"..".left_score))
