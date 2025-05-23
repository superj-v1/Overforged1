class_name ComponenteInventario
extends RefCounted

var slot : Dictionary = {}
signal atualizar_inventario_ui

func add_item(item : DadosItens) -> void:
	if slot.has(item):
		if slot[item] < 1:
			slot[item] += 1
		else:
			return
	atualizar_inventario_ui.emit()
	print(slot)

func checar_slot(item : DadosItens) -> bool:
	if slot.has(item):
		if slot[item] == 1:
			return true
		else:
			return false
	else:
		return true

func get_conteudo_slot() -> Dictionary:
	return slot
