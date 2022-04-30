extends Area2D

var min_speed = 3
var max_speed = 7
var min_rot_speed = 0.01
var max_rot_speed = 0.1

var speed = rand_range(min_speed, max_speed)
var rotation_speed = rand_range(min_rot_speed, max_rot_speed)

var pl_kill_effect = preload("res://MeteorKillEffect.tscn")

func _process(delta):
	position.y += speed 
	rotation += rotation_speed

func play_effect():
	var effect = pl_kill_effect.instance()
	effect.global_position = global_position
	get_tree().current_scene.add_child(effect)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_MeteorSmall_tree_exiting():
	play_effect()
