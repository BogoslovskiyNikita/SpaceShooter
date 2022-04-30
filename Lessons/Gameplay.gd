extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene("res://Main Menu.tscn")
	
	if Input.is_action_just_pressed("pause"): 
		get_tree().paused = true
		$Button.show()






func _on_Button_pressed():
	get_tree().paused = false
	$Button.hide()




func _on_Button1_button_down():
Input.action_press("player_down")


func _on_Button1_button_up():
	Input.action_release("player_down")


func _on_Button2_button_down():
	Input.action_press("player_up")


func _on_Button2_button_up():
	Input.action_release("player_up")


func _on_Button3_button_down():
	Input.action_press("player_right")


func _on_Button3_button_up():
	Input.action_release("player_right")


func _on_Button4_button_up():
	Input.action_release("player_left")


func _on_Button4_button_down():
	Input.action_press("player_left")
