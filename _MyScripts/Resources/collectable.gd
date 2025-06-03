extends Node2D

## Has all the information of the item
@export var collectable_data : ItemData = null
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal item_sound_pickup

func _ready() -> void:
	# If item has texture, then set the texture
	if collectable_data.item_texture != null:
		sprite_2d.texture = collectable_data.item_texture
		sprite_2d.sprite_frames = null
	elif collectable_data.item_frames != null:
		animated_sprite_2d.sprite_frames = collectable_data.item_frames
		sprite_2d.texture = null
		animated_sprite_2d.play("default")

func _on_area_2d_body_entered(body: Node2D) -> void:
	var StackInvOrPick : int = 0
	if body.is_in_group("Players") or body is PlayerEntity:
		#print("No coin for you :3")
		print(body.name + " found : " + collectable_data.item_name)
		StackInvOrPick = body.inventory_component.check_inventory_contents(collectable_data)
		if StackInvOrPick == 1:
			body.inventory_component.add_item(collectable_data)
			item_sound_pickup.emit()
			queue_free()
		else:
			if StackInvOrPick == 0:
				print("ERROR! Inventory full")
			elif StackInvOrPick == 2:
				print("ERROR! Max stack for item")
