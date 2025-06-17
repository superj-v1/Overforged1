extends Node2D
var COLLECTABLE = preload("res://_MyScenes/Collectables/collectable.tscn") as PackedScene
const COPPER_BAR = preload("res://_MyScripts/Resources/Items/CopperBar.tres") as ItemData
var cool : Node2D

var bars_spawned : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bars_spawned < 1:
		if Input.is_action_just_pressed("ui_accept"):
			cool = COLLECTABLE.instantiate()
			cool.collectable_data = COPPER_BAR
