class_name Crafting_UI
extends PanelContainer
@onready var crafting_ui_root: MarginContainer = $".."

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
# The label which describes the item with flavour text
# WARNING THE TEXT IS NOT EDIBLE
@onready var item_description_label: Label = %ItemDescriptionLabel
# The grid which contains all the items of which you can
# craft
@onready var gridy_container: GridContainer = %GridyContainer
# The texture of the current item we can craft
@onready var item_craft_texture_ui: TextureRect = %ItemCraftTextureUI

# The actual dictionary that contains all the recipes
# that the bench will craft
var recipe_material_dictionary : Dictionary = {}

# The inventory of the player
var player_inventory : InventoryComponent = null

# The recipe that the player selected, duh!
var selected_recipe : ItemRecipe = null

@onready var craft_button: Button = %CraftButton

var player_inventory_contents : Dictionary = {}

func _ready() -> void:
	build_recipe_tree()

func set_player_inventory(new_inventory : InventoryComponent) -> void:
	player_inventory = new_inventory
	
	if selected_recipe == null:
		selected_recipe = recipes_array[0]
		build_recipe_material_window(recipes_array[0])
	else:
		build_recipe_material_window(selected_recipe)

func build_recipe_tree() -> void:
	# Hide the root of the tree so that no empty cell
	# is present on the tree
	craft_tree.hide_root = true
	# the second cell in the item tree
	# which will act as an pseudo root
	# for all the others cell in the tree
	var tree_root : TreeItem = craft_tree.create_item()
	
	for recipe in recipes_array:
		var new_recipe_slot : TreeItem = craft_tree.create_item(tree_root)
		if recipe.recipe_final_product_item.item_texture != null:
			new_recipe_slot.set_icon(0, recipe.recipe_final_product_item.item_texture)
		elif recipe.recipe_final_product_item.item_frames.get_frame_texture("default",0) != null:
			new_recipe_slot.set_icon(0, recipe.recipe_final_product_item.item_frames.get_frame_texture("default",0))
		else:
			print("No texture or animation frame for the item")
			pass
		new_recipe_slot.set_text(0, recipe.recipe_final_product_item.item_name)

func _on_craft_tree_cell_selected() -> void:
	# capture the recipe name so we can search for it later
	var cell_recipe_name : String = craft_tree.get_selected().get_text(0)
	#print(cell_recipe_name)
	# If causes slowdown later in testing, search for optimization
	for recipe in recipes_array:
		# the Recipe exits, yay
		if recipe.recipe_final_product_item.item_name == cell_recipe_name:
			# now we write its values on the crafting UI
			build_recipe_material_window(recipe)
			selected_recipe = recipe
			return

func build_recipe_material_window(selected_recipe : ItemRecipe) -> void:
	clean_material_window()
	
	title_label.text = selected_recipe.recipe_final_product_item.item_name
	item_description_label.text = selected_recipe.recipe_final_product_item.item_description
	if selected_recipe.recipe_final_product_item.item_texture != null:
		item_craft_texture_ui.texture = selected_recipe.recipe_final_product_item.item_texture
	elif selected_recipe.recipe_final_product_item.item_frames.get_frame_texture("default",0) != null:
		item_craft_texture_ui.texture = selected_recipe.recipe_final_product_item.item_frames.get_frame_texture("default",0)
	else:
		print("No texture or animation frame for the item")
		pass
	
	for recipe_material in selected_recipe.recipe_material_array:
		if recipe_material_dictionary.has(recipe_material):
			recipe_material_dictionary[recipe_material] += 1
		else:
			recipe_material_dictionary[recipe_material] = 1
		
	#print(recipe_material_dictionary)
	for material_key in recipe_material_dictionary:
		var new_material = inventory_slot.instantiate() as InventorySlot
		gridy_container.add_child(new_material)
		new_material.set_item_data(material_key, recipe_material_dictionary[material_key])
	
	check_recipe_craftable()
	

func check_recipe_craftable() ->void:
	player_inventory_contents = player_inventory.get_inventory_contents()
	
	if player_inventory_contents.has_all(recipe_material_dictionary.keys()):
		print("Has eggs")
		for key in recipe_material_dictionary:
			if player_inventory_contents[key] == recipe_material_dictionary[key]:
				craft_button.set_disabled(false)
				print("Enough Eggs")
			else:
				craft_button.set_disabled(true)
				print("Not enough Eggs")
				return
	else:
		craft_button.set_disabled(true)
		print("Doesn't have eggs")

# Clean the material requirements so that
# they don't keep duplicating on the cratfing UI
func clean_material_window() -> void:
	recipe_material_dictionary.clear()
	
	for child in gridy_container.get_children():
		child.queue_free()

# Closes the crafting UI when the destineer(OUR player)
# clicks the [SuspicioslyXShapedButton]
func _on_exit_button_button_down() -> void:
	crafting_ui_root.hide()


func _on_craft_button_button_down() -> void:
	player_inventory_contents = player_inventory.get_inventory_contents()
	
	for recipe_material in recipe_material_dictionary:
		# Create Remove Function
		player_inventory.remove_item(recipe_material, recipe_material_dictionary[recipe_material], false)
		
	
	player_inventory.add_item(selected_recipe.recipe_final_product_item, 1)
	
	check_recipe_craftable()
