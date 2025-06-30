extends Node2D

## Has all the information of the item
@export var collectable_data : ItemData = null
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_1: PlayerEntity
@export var floatoffset : float = 0
@export var angle : float = 0
@export var floatSpeed : float = 100

signal item_sound_pickup

func _ready() -> void:
	sprite_2d.texture = null
	animated_sprite_2d.sprite_frames = null

func _process(delta) -> void:
	if collectable_data == null:
		player_1 = get_tree().get_first_node_in_group("Players")
		for key in player_1.inventory_component.get_inventory_contents():
			if key != null:
				collectable_data = key
			else:
				print("No item is availabel ;m;")
		# If item has texture, then set the texture
		if collectable_data != null:
			if collectable_data.item_texture != null:
				sprite_2d.texture = collectable_data.item_texture
				animated_sprite_2d.sprite_frames = null
			elif collectable_data.item_frames != null:
				animated_sprite_2d.sprite_frames = collectable_data.item_frames
				sprite_2d.texture = null
				animated_sprite_2d.play("default")
	if(angle > 360):
		angle = 0
	angle += deg_to_rad(floatSpeed * delta)
	floatoffset = 2 * sin(angle)
	#print("floatoffset = ", floatoffset)
	if sprite_2d.texture != null:
		sprite_2d.offset.y = floatoffset
	elif animated_sprite_2d.sprite_frames != null:
		animated_sprite_2d.offset.y = floatoffset
	
