extends Control

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _on_Play_Button_pressed():
	get_tree().change_scene("res://Gameplay.tscn")

func _on_Exit_Button_pressed():
	get_tree().quit()
	

