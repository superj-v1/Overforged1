extends Node2D
@onready var front: RayCast2D = $"../Front"
@onready var carried_item: Node2D = $Carried_Item
@onready var player_1_corpo: Sprite2D = $"../Corpo"

var old_z_index : int
#var old_player_z_index : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	old_z_index = carried_item.z_index
	#old_player_z_index = player_1_corpo.z_index
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = front.target_position
	if front.target_position.y < 0:
		#player_1_corpo.z_index = old_player_z_index + 2
		carried_item.z_index = player_1_corpo.z_index - 1
	else:
		carried_item.z_index = old_z_index
		#player_1_corpo.z_index = old_player_z_index
	pass
