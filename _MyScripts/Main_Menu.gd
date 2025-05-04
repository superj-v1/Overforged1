class_name MainMenu
extends Control

@onready var start_btn: Button = $MarginContainer/VBoxContainer/StartBtn as Button
@onready var settings_btn: Button = $MarginContainer/VBoxContainer/SettingsBtn as Button
@onready var quit_btn: Button = $MarginContainer/VBoxContainer/QuitBtn as Button
@onready var start_level = preload("res://teste.tscn") as PackedScene

func _ready():
	start_btn.button_down.connect(on_start_pressed)
	quit_btn.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)


func on_exit_pressed() -> void:
	get_tree().quit(0)
