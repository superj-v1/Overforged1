extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	else:
		animated_sprite_2d.play("idle_front")
	#direction = GameInputEvents.movement_input()
	#
	#if direction == Vector2.UP:
		#animated_sprite_2d.play("idle_back")
	#elif direction == Vector2.RIGHT:
		#animated_sprite_2d.play("idle_right")
	#elif direction == Vector2.LEFT:
		#animated_sprite_2d.play("idle_left")
	#elif direction == Vector2.DOWN:
		#animated_sprite_2d.play("idle_front")
	#else:
		#animated_sprite_2d.play("idle_front")

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	
	if GameInputEvents.use_tool():
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		if player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")
		if player.current_tool == DataTypes.Tools.WaterCrops:
			transition.emit("Watering")
	#if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		#transition.emit("Chopping")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animated_sprite_2d.stop()
