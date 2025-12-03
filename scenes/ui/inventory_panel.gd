extends PanelContainer

@onready var log_label: Label = $MarginContainer/VBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel

@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel

@onready var egg_label: Label = $MarginContainer/VBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	

func on_inventory_changed() -> void:
	var inventory = InventoryManager.inventory
	
	if inventory.has("Log"):
		log_label.text = str(inventory["Log"])
	
	if inventory.has("Stone"):
		stone_label.text = str(inventory["Stone"])
	
	if inventory.has("Corn"):
		corn_label.text = str(inventory["Corn"])
	
	if inventory.has("Tomato"):
		tomato_label.text = str(inventory["Tomato"])
	
	if inventory.has("Egg"):
		egg_label.text = str(inventory["Egg"])
	
	if inventory.has("Milk"):
		milk_label.text = str(inventory["Milk"])
	
