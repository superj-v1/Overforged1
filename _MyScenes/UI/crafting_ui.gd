class_name Crafting_UI
extends PanelContainer

# The invnetory slot that you're gonna instantiate
@export var inventory_slot: PackedScene = null
# An array of recipes that are assigned manually because
# Godot gets brain damage when building the game and 
# can't remenber the location of recipes on the final 
# build of the game.
@export var recipes_array : Array[ItemRecipe] = []

# The tree node. There is no one behind it?!
@onready var craft_tree: Tree = %CraftTree

# The label which says which item is going to be crafted
@onready var title_label: Label = %TitleLabel
# The grid which contains all the items of which you can
# craft
@onready var gridy_container: GridContainer = %GridyContainer
# The texture of the current item we can craft
@onready var item_craft_texture_ui: TextureRect = %ItemCraftTextureUI


func _ready() -> void:
	pass # Replace with function body.
