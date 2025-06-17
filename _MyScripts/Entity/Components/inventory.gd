class_name  InventoryComponent

var inventory_contents : Dictionary = {}
var max_inventory_slots : int = 1
var currrent_inventory_slots : int = 0

signal update_inventory_ui
signal play_item_pickup_sound

# Function that adds items
func add_item(item : ItemData) -> void:
	# Checks if item exists in inventory
	if inventory_contents.has(item):
		# Checks item slot has space for another of the same item
		if inventory_contents[item] < item.item_stack_size:
			inventory_contents[item] += 1
			#if !audio_stream_player_2d.is_playing():
				#audio_stream_player_2d.stream = collectable_data.item_pickup_sound
				#audio_stream_player_2d.play()
		# if item slot full, sorry can't pickup the item
		else:
			print("Error! %s slot has no more space for more items\n", item.item_name)
	# If number of inventory slots that are occupied is bigger than the number of
	# slots that are free, you can't pickup new items
	elif currrent_inventory_slots < max_inventory_slots:
		inventory_contents[item] = 1
		currrent_inventory_slots = currrent_inventory_slots + 1
	# If inventory is full, sorry can't pickup the item
	else:
		print("Error! Your inventory is full")
	
	print(inventory_contents)
	update_inventory_ui.emit()

func check_inventory_contents(item : ItemData) -> int:
	# 0 -> Inventory Full, 1 -> Can Pickup, 2 -> Stack Size Full
	var canPickup : int = 0
	#canPickup = add_item(item)
	#return canPickup
	if inventory_contents.has(item):
		if inventory_contents[item] < item.item_stack_size:
			canPickup = 1
		else:
			canPickup = 2
	elif currrent_inventory_slots >= max_inventory_slots:
		canPickup = 0
	else:
		canPickup = 1
	return canPickup

func get_inventory_contents() -> Dictionary:
	return inventory_contents
