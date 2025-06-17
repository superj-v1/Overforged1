extends CanvasLayer

@onready var inventory_ui: InventoryUI = %Inventory_UI
@onready var player_1: PlayerEntity = %Player1

func _unhandled_input(event: InputEvent) -> void:
	pass
	#if Input.is_action_just_pressed("open_inventory"):
		#if inventory_ui.visible == false:
			#inventory_ui.show()
			#inventory_ui.populate_inventory(player_1.inventory_component)
			#return
		#else:
			#inventory_ui.hide()
			#return
