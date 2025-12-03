class_name InventoryUI
extends PanelContainer

@export var inventory_slot : PackedScene = null
@onready var inventory_grid: GridContainer = %InventoryGrid

#func populate_inventory(inventory : InventoryComponent) -> void:
	#clean_inventory()
	#
	#for item in inventory.get_inventory_contents():
		##if inventory_grid.get_children() != null:
			##for item_slot in inventory_grid.get_children():
				##if item_slot.item_data == item:
					##pass
				##else:
					##pass
		#
		#var new_slot = inventory_slot.instantiate() as InventorySlot
		#inventory_grid.add_child(new_slot)
		#new_slot.set_item_data(item, inventory.get_inventory_contents()[item])
	#
	#if inventory.update_inventory_ui.is_connected(populate_inventory):
		##print("inventory connected")
		#return
	#else:
		#inventory.update_inventory_ui.connect(populate_inventory.bind(inventory))
	#

func clean_inventory() -> void:
	for item_slot in inventory_grid.get_children():
		item_slot.queue_free()

func _on_exit_button_button_down() -> void:
	clean_inventory()
	hide()
