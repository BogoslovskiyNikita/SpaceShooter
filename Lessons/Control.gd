extends Control

onready var score_label = $Label
onready var life = $HBoxContainer/life
onready var life2 = $HBoxContainer/life2
onready var life3 = $HBoxContainer/life3

var score = 0
var lives = 3


func change_score(new):
	score = new
	score_label.text = str(score)
	
func change_lives(new):
	new = min(new, 3)
	lives = new 
	if new == 3:
		life.visible = true
		life2.visible = true
		life3.visible = true
	if new == 2: 
		life.visible = false
		life2.visible = true
		life3.visible = true
	if new == 1:
		life.visible = false
		life2.visible = false
		life3.visible = true
	if new == 0:
		life.visible = false
		life2.visible = false
		life3.visible = false
		
	

