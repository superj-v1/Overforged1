class_name ItemRecipe
extends Resource

## The name of your recipe
## HUMAN! I REMEMBER YOURE RECIPES!
@export var recipe_name : String = "Recipe For Noobs"

## The item that the recipe produces
@export var recipe_final_product_item : ItemData = null

## The items that are consumed to produce said item.
## Usually in our recipes the max array size is going to
## be no bigger than 3. If necessary we can have a big item
## be composed of multiple smaller recipes
@export var recipe_material_array : Array[ItemData] = []

## How many times does the character nedd to interact with the
## anvil to produce the item
@export_range(0,999) var amount_of_hammer_strikes : int = 1

## The minimum temperature an item needs to have
## to be considered for crafting this specific item
@export_range(0,9999999) var item_temperature_minimum : int = 300
## The maximum temperature an item needs to have
## to be considered for crafting this specific item
@export_range(0,9999999) var item_temperature_maximun : int = 6000
