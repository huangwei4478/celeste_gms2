// Inherit the parent event
event_inherited();

var player = instance_place(x, y, objPlayer);
if (player != noone) {
	// TODO: audio play sound
	ds_list_add(global.got_fruit, global.level_index);
	instance_create_layer(x, y, "Instances", objLifeUp);
	instance_destroy();
} else {
	offset += 9;
	y = start + dsin(offset) * 2.5;
}




