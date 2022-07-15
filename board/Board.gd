extends Node2D

onready var tiles = $Tiles
onready var start_tile = $Tiles/StartIsland
onready var end_tile = $Tiles/EndIsland

var tile_types = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://board/tiles.json", file.READ)
	var text = file.get_as_text()
	var tile_types_json = JSON.parse(text)
	file.close()

	if tile_types_json.error == OK:
		self.tile_types = tile_types_json.result
	
	randomize()
	randomize_level()


func randomize_level():
	# randomize tiles
	for tile in tiles.get_children():
		random_island(tile)

	start_tile.set_type(tile_types.islands[tile_types.start_island])
	end_tile.set_type(tile_types.islands[tile_types.end_island])


func random_island(tile):
	var index = randi() % len(tile_types.islands)
	while index == tile_types.start_island || index == tile_types.end_island:
		index = randi() % len(tile_types.islands)
	tile.set_type(tile_types.islands[index])
