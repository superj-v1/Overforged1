extends Label

@onready var label: Label = $"."

# Zito precisamos depois fazer isso aqui para que
# quando o jogaodr modificar o tecla de interação
# ela atualize no jogo.
#func _process(delta: float) -> void:
	#label.text = str(ProjectSettings.get_setting_with_override("input/show_dialogue"))
	#InputMap.action_get_events("show_dialogue")[0]
