extends Area2D

func _on_body_entered(body):
	if body == $"../ball":
		$"..".right_score += 1
		$"..".rally = 0
		$"../ball".dir_x_decide = 0
		$"../ball"._ready()
