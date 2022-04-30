extends Control

var status = true

func _on_Sound_Button_pressed():
	if status:
		$"Sound Button".text = "OFF"
		status = not status
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'), -80)
	else:
		$"Sound Button".text = "ON"
		status = not status
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'), 10)



func _on_Exit_To_Menu_Button_pressed():
	get_tree().change_scene("res://Main Menu.tscn")


func _on_HSlider_value_changed(value):
	$"Slider Label".text = str((value + 50) * 2) 
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'), value)
