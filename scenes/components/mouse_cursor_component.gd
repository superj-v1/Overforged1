extends Node

@export var cursor_idle_component_texture: Texture2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_idle_component_texture, Input.CURSOR_ARROW)
	
