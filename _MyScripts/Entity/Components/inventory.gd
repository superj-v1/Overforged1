extends Node2D
class_name InventoryComponent

var inventory_contents : Dictionary = {}
var max_inventory_slots : int = 1
var currrent_inventory_slots : int = 0
#var entity_container: Node2D
var collectable_base = preload("res://_MyScenes/Collectables/collectable.tscn") as PackedScene
@onready var drop_item_range: CollisionShape2D = $"../Area2D/Drop Item Range"
@onready var inventory_node: InventoryComponent = $"."

signal update_inventory_ui
signal play_item_pickup_sound

func _ready():
	#entity_container = Engine.get_main_loop().root.get_node("Da_testo/Entity_Container")
	pass

# Function that adds items
func add_item(item : ItemData, bonus_slots : int) -> void:
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
	elif currrent_inventory_slots < max_inventory_slots + bonus_slots:
		inventory_contents[item] = 1
		currrent_inventory_slots = currrent_inventory_slots + 1
	# If inventory is full, sorry can't pickup the item
	else:
		#var new_collectable = collectable_base.instantiate() as Node2D
		#new_collectable.get_child(0).collectable_data = item
		#new_collectable.global_position = drop_item_range.global_position
		#player_1.add_child(new_collectable)
		
		print("Error! Your inventory is full")
	
	print(inventory_contents)
	update_inventory_ui.emit()

func remove_item(item : ItemData, amount : int, is_drop : bool) -> void:
	if is_drop == false:
		if inventory_contents[item] > amount:
			inventory_contents[item] -= amount
		else:
			inventory_contents.erase(item)
			currrent_inventory_slots -= 1
	else:
		if inventory_contents[item] > amount:
			inventory_contents[item] -= amount
			for i in amount:
				var newnode : Node2D = collectable_base.instantiate()
				var old_transform : Transform2D
				newnode.collectable_data = item
				self.add_child(newnode)
				old_transform = newnode.global_transform
				newnode.reparent(Engine.get_main_loop().root.get_node("Da_testo/Entity_Container"), true)
				newnode.global_transform = old_transform
		else:
			var newnode : Node2D = collectable_base.instantiate()
			var old_transform : Transform2D
			newnode.collectable_data = item
			self.add_child(newnode)
			old_transform = Engine.get_main_loop().root.get_node("Da_testo/Entity_Container/Player1").get_transform()
			newnode.reparent(Engine.get_main_loop().root.get_node("Da_testo/Entity_Container"), true)
			newnode.set_global_transform(old_transform)
			inventory_contents.erase(item)
			currrent_inventory_slots -= 1
	

#func change_parent(new_parent):
	#call_deferred("_reparent", new_parent, self, get_global_transform())
#
#func _reparent(new_parent, node, old_transform):
	#node.get_parent().remove_child(node)
	#new_parent.add_child(node)
	#node.transform = new_parent.get_global_transform.inverse() * old_transform


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
