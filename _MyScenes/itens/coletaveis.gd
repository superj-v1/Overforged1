extends Node2D

@export var dados_coletaveis : DadosItens = null
@onready var sprite2d : Sprite2D = $Sprite2D

func _ready() -> void:
	sprite2d.texture = dados_coletaveis.textura_item

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Players:
		print("deu certo")
