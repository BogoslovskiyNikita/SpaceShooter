extends Node2D

var speed = 10

func _process(delta):
	position.y -= speed


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #удалить объект 
	


func _on_Bullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.queue_free()
		queue_free()
		GlobalControl.change_score(GlobalControl.score + 1)
