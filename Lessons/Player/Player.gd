extends Area2D

var speed = 5

onready var sprite = $Sprite
onready var FiringPositions = $FiringPositions
onready var fire_delay_timer = $FireDelayTimer
onready var collision = $CollisionPolygon2D
onready var shield_timer = $ShieldTimer
onready var shoot_sound = $ShootSound

var pl_bullet = preload("res://Bullet/Bullet.tscn")

export var step = 50

func disable_collision():
	collision.set_deferred("disabled", true)
	
	
func enable_collision():
	collision.set_deferred("disabled", false)
	
func check_shield():
	if shield_timer.is_stopped():
		enable_collision()
	


func kill():
	queue_free()
	get_tree().reload_current_scene()
	GlobalControl.change_score(0)
	GlobalControl.change_lives(3)
	
func damage():
	GlobalControl.change_lives(GlobalControl.lives - 1)
	if GlobalControl.lives == 0:
		kill()



func _ready():
	pass

func _process(delta):
	check_shield()
	
	if Input.is_action_pressed("player_left"):
		position.x -= speed
		sprite.frame = 0
	elif Input.is_action_pressed("player_right"):
		position.x += speed
		sprite.frame = 2
	else:
		sprite.frame = 1
		
	if Input.is_action_pressed("player_up"):
		position.y -= speed 
	if Input.is_action_pressed("player_down"):
		position.y += speed 
		
	if Input.is_action_pressed("player_rotate"):
		rotation += 0.1
		
	if Input.is_action_pressed("player_shoot") and fire_delay_timer.is_stopped():
		shoot_sound.play(0.4)
		fire_delay_timer.start()
		for child in FiringPositions.get_children():
			var bullet = pl_bullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)	
		
	var view_rect = get_viewport_rect()
	position.x = clamp(position.x, step, view_rect.size.x - step)
	position.y = clamp(position.y, step, view_rect.size.y - step)


func _on_Player_area_entered(area):
	if area.is_in_group("enemy"):
		damage()
	if area.is_in_group("shield"):
		disable_collision()
		shield_timer.start()
		area.queue_free()
