extends Node2D

@export var dados_coletaveis : DadosItens = null
@onready var sprite2d : Sprite2D = $Sprite2D

func _ready() -> void:
	sprite2d.texture = dados_coletaveis.textura_item

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Players:
		print(body.name + " encontrou " + dados_coletaveis.nome_item)
		if body.componentes_slot.checar_slot(dados_coletaveis) == true:
			body.componentes_slot.add_item(dados_coletaveis)
			queue_free()
		else:
			print("Você só tem duas mãos")
