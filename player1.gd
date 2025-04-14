extends CharacterBody2D

@export var velocidade = 500

func detec_imput():
    var direcao = input.get_vector("left". "right", "up", "down")
    velocity = direcao.normalize() * velocidade
func _process_physics(delta):
    detec_imput()
    move_and_slide()
