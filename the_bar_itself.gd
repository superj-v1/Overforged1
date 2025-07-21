extends Node2D
var COLLECTABLE = preload("res://_MyScenes/Collectables/collectable.tscn") as PackedScene
const COPPER_BAR = preload("res://_MyScripts/Resources/Items/CopperBar.tres") as ItemData
var cool : Node2D
@onready var the_bar_itself: Node2D = $"."

@export var orbitaldistance1 : float = 0
@export var orbitaldistance2 : float = 0
@export var angle : float = 0
@export var floatSpeed : float = 100

var bars_spawned : int = 0

var isPlayerInVicinity : bool = false

var movingObject : Node2D

func float_spin(delta : float) -> void:
	if(angle > 360):
		angle = 0
	angle += deg_to_rad(floatSpeed * delta)
	orbitaldistance1 = 30 * sin(angle)
	angle += deg_to_rad(floatSpeed * delta)
	orbitaldistance2 = 30 * cos(angle)
	the_bar_itself.position.x = orbitaldistance1
	the_bar_itself.position.y = orbitaldistance2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	float_spin(delta)
	if isPlayerInVicinity == true:
		if bars_spawned < 1:
			if Input.is_action_just_pressed("ui_accept"):
				cool = COLLECTABLE.instantiate()
				cool.collectable_data = COPPER_BAR
				the_bar_itself.add_child(cool)
				bars_spawned += 1
		if the_bar_itself.get_child_count() == 0:
			bars_spawned = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players") or body is PlayerEntity:
		isPlayerInVicinity = true
		movingObject = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Players") or body is PlayerEntity:
		isPlayerInVicinity = false
		movingObject = null
	pass # Replace with function body.
