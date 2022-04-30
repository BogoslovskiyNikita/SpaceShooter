extends Node2D


onready var timer = $Timer
onready var parcticles = $CPUParticles2D

func _ready():
	timer.wait_time = parcticles.lifetime
	
func _process(delta):
	if timer.is_stopped():
		queue_free()


