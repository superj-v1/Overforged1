extends Node2D

## Has all the information of the item
@export var collectable_data : ItemData = null
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var delay: Timer = $Delay

var isPlayerInVicinity : bool = false

var movingObject : Node2D

signal item_sound_pickup

func _ready() -> void:
	# If item has texture, then set the texture
	if collectable_data.item_texture != null:
		sprite_2d.texture = collectable_data.item_texture
		sprite_2d.sprite_frames = SpriteFrames.new()
	elif collectable_data.item_frames != null:
		animated_sprite_2d.sprite_frames = collectable_data.item_frames
		sprite_2d.texture = null
		animated_sprite_2d.play("default")

#func interact_with_object() -> void:
	#var StackInvOrPick : int = 0
	#print(movingObject.name + " found : " + collectable_data.item_name)
	#StackInvOrPick = movingObject.inventory_component.check_inventory_contents(collectable_data)
	#if StackInvOrPick == 1:
		#movingObject.inventory_component.add_item(collectable_data)
		#item_sound_pickup.emit()
		#queue_free()
	#else:
		#if StackInvOrPick == 0:
			#print("ERROR! Inventory full")
		#elif StackInvOrPick == 2:
			#print("ERROR! Max stack for item")
#
#func item_collected():
	#if movingObject != null:
		#if (movingObject.is_in_group("Players") or movingObject is PlayerEntity):
			##print("No coin for you :3")
			#if movingObject.interact_with_object.is_connected(item_collected):
				#print("object connected")
				#return
			#else:
				#movingObject.interact_with_object.connect(item_collected.bind(movingObject))
		#else:
			#delay.wait_time = 5
			#delay.start()
	#else:
		#delay.wait_time = 5
		#delay.start()
#
#func _process(delta: float) -> void:
	#item_collected()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	#movingObject = body
	#var StackInvOrPick : int = 0
	if body.is_in_group("Players") or body is PlayerEntity:
		isPlayerInVicinity = true
		movingObject = body
		#print("No coin for you :3")
		#print(body.name + " found : " + collectable_data.item_name)
		#StackInvOrPick = body.inventory_component.check_inventory_contents(collectable_data)
		#if StackInvOrPick == 1:
			#body.inventory_component.add_item(collectable_data)
			#item_sound_pickup.emit()
			#queue_free()
		#else:
			#if StackInvOrPick == 0:
				#print("ERROR! Inventory full")
			#elif StackInvOrPick == 2:
				#print("ERROR! Max stack for item")

#
#func _on_delay_timeout() -> void:
	#if movingObject != null:
		#if (movingObject.is_in_group("Players") or movingObject is PlayerEntity):
			#pass
		#else:
			#print("NO INTEREST...")
	#else:
		#print("NO CONTACT...")
	#pass # Replace with function body.

func _process(delta: float) -> void:
	var StackInvOrPick : int = 0
	if movingObject != null:
		if Input.is_action_just_pressed("ui_accept"):
			print(movingObject.name + " found : " + collectable_data.item_name)
			StackInvOrPick = movingObject.inventory_component.check_inventory_contents(collectable_data)
			if StackInvOrPick == 1:
				movingObject.inventory_component.add_item(collectable_data)
				item_sound_pickup.emit()
				queue_free()
			else:
				if StackInvOrPick == 0:
					print("ERROR! Inventory full")
				elif StackInvOrPick == 2:
					print("ERROR! Max stack for item")
			pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Players") or body is PlayerEntity:
		isPlayerInVicinity = false
		movingObject = null
		pass
