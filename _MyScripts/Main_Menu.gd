class_name MainMenu
extends Control

@onready var start_btn: Button = $MarginContainer/VBoxContainer/StartBtn as Button
@onready var settings_btn: Button = $MarginContainer/VBoxContainer/SettingsBtn as Button
@onready var quit_btn: Button = $MarginContainer/VBoxContainer/QuitBtn as Button
@onready var settings_menu: SettingsMenu = $SettingsMenu as SettingsMenu
@onready var margin_container: MarginContainer = $MarginContainer as MarginContainer

@onready var start_level = preload("res://teste.tscn") as PackedScene

func _ready():
	handle_connecting_signals()

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_settings_pressed() -> void:
	#print("Load Options Menu")
	margin_container.visible = false
	settings_menu.set_process(true)
	settings_menu.visible = true
	

func on_quit_pressed() -> void:
	get_tree().quit(0)

func on_exit_settings_menu() -> void:
	margin_container.visible = true
	settings_menu.visible = false

func handle_connecting_signals() -> void:
	start_btn.button_down.connect(on_start_pressed)
	settings_btn.button_down.connect(on_settings_pressed)
	quit_btn.button_down.connect(on_quit_pressed)
	settings_menu.exit_settings_menu.connect(on_exit_settings_menu)
