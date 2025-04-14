extends CharacterBody2D

@export var velocidade = 250

func detec_input():
	#if Input.get_axis()
	var direcao = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direcao = Input.
	velocity = direcao.normalized() * velocidade
	
func _physics_process(delta):
	detec_input()
	move_and_slide()
	
