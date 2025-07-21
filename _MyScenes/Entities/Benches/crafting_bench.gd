class_name CraftingBench
extends Area2D

var is_player_in_vicinity : bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerEntity or body.is_in_group("Players"):
		is_player_in_vicinity = true
		#print("Player Body entered...")


func _on_body_exited(body: Node2D) -> void:
	if body is PlayerEntity or body.is_in_group("Players"):
		is_player_in_vicinity = false
		print("Player Body exited...")

func _process(delta: float) -> void:
	pass
	#if is_player_in_vicinity:
		#if Input.is_action_just_pressed("ui_accept"):
			#print("Player interacted with anvil")
