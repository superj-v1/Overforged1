extends CanvasLayer

@onready var inventory_ui: InventoryUI = %Inventory_UI
@onready var player_1: PlayerEntity = %Player1
@onready var crafting_bench: CraftingBench = $"../Entity_Container/CraftingBench/CraftingBench"
@onready var crafting_ui_system: Crafting_UI = $Crafting_UI/CraftingUI
@onready var crafting_ui: MarginContainer = %Crafting_UI


func _unhandled_input(event: InputEvent) -> void:
	pass
	if Input.is_action_just_pressed("open_inventory"):
		if inventory_ui.visible == false:
			inventory_ui.show()
			inventory_ui.populate_inventory(player_1.inventory_component)
			return
		else:
			inventory_ui.hide()
			return
	if crafting_bench.is_player_in_vicinity == true:
		if Input.is_action_just_pressed("interact"):
			crafting_ui_system.set_player_inventory(player_1.inventory_component)
			
			if inventory_ui.visible == true:
				inventory_ui.hide()
			
			if crafting_ui.visible == false:
				crafting_ui.show()
			else:
				crafting_ui.hide()
			
	else:
		crafting_ui.hide()
