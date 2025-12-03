extends Node

var allow_save_game: bool

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("save_game"):
		save_game()
	elif event.is_action_pressed("load_game"):
		load_game()

## Saves the game, by saving the data on the [u]first[/u] [b]node[/b]
## in the group [color=orange]"save_level_data_component"[/color].[br]
##
## In case the data is [color=red]null[/color], this function does nothing.
func save_game() -> void:
	var save_level_data_component: SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	
	if save_level_data_component != null:
		save_level_data_component.save_game()
	

## Loads the game, by loading the data saved on the [u]first[/u] [b]node[/b]
## in the group [color=orange]"save_level_data_component"[/color].[br]
##
## In case the data is [color=red]null[/color], this function does nothing.
func load_game() -> void:
	await get_tree().process_frame
	
	var save_level_data_component: SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	
	if save_level_data_component != null:
		save_level_data_component.load_game()
	
