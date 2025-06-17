extends AnimatedSprite2D

@onready var interaction_range_shape: CollisionShape2D = $".."
@export var multiplier_of_size : float = 1.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var size = interaction_range_shape.shape.radius
	if size > 15:
		apply_scale( Vector2(size * multiplier_of_size / 15, size * multiplier_of_size / 15))
