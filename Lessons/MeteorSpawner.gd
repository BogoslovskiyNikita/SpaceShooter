extends Node2D

onready var spawn_timer = $SpawnTimer

var pl_meteor = preload("res://MeteorSmall.tscn")
var pl_meteor_big = preload("res://MeteorBig.tscn")


onready var max_x = get_viewport_rect().size.x # poluchit razmer ekrana po x
var min_x = 0
var y = 10 

func spawn():
	#спавним маленький метеор
	var meteor = pl_meteor.instance()
	meteor.global_position = Vector2(rand_range(min_x, max_x), y)
	get_tree().current_scene.add_child(meteor)
	
	#спавним большой метеор
	var meteor_big = pl_meteor_big.instance()
	meteor_big.global_position = Vector2(rand_range(min_x, max_x), y)
	get_tree().current_scene.add_child(meteor_big)
	
	
func _process(delta):
	if spawn_timer.is_stopped():
		spawn_timer.start()
		spawn()
