/// @description Generate Blocker for tileset

var _tilemap = layer_tilemap_get_id("RockLayer");

for (var i = 0; i <= 16; i++) {
	for (var j = 0; j <= 16; j++) {
		var _tile = tilemap_get_at_pixel(_tilemap, i * 8, j * 8);
		if (_tile != 0) {
			instance_create_layer(i * 8, j * 8, "CollisionInstances", objSolid);
		}
	}
}


