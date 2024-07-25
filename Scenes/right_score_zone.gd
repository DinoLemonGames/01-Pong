extends Area2D

func _on_body_entered(body):
	if body == $"../ball":
		$"..".left_score += 1
		$"..".rally = 0
		$"../ball".dir_x_decide = 1
		$"../ball"._ready()
