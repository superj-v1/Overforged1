extends Node

const SETTINGS_SCENE := "res://scenes/ui/settings.tscn"

func open_settings() -> void:
	get_tree().change_scene_to_file(SETTINGS_SCENE)
