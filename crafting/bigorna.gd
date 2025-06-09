class_name Bancada
extends Area2D

var interagivel = false


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerEntity:
		interagivel = true


func _on_body_exited(body: Node2D) -> void:
	if body is PlayerEntity:
		interagivel = false
