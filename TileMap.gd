extends TileMap

var _tileset 

func _ready():
	_tileset = get_tileset()
	
	set_process_input(true)

func _input(event):
	var tile_pos = world_to_map(event.position)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			set_cellv(tile_pos, _tileset.find_tile_by_name("DirtTileset"))
			update_bitmask_area(tile_pos)

func _physics_process(delta):
	update_bitmask_area(position)
