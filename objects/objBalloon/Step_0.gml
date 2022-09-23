event_inherited();

if (visible) {
	offset += 3.6;
	y = start + dsin(offset) * 2;
	var player = instance_place(x, y, objPlayer);
	if (player != noone) {
		if (player.djump < global.max_djump) {
			// TODO play dash restore sound
			instance_create_depth(x, y, -100, objSmokeParticle);
			player.djump = global.max_djump;
			visible = false;
			timer = 60;	// 2 seconds to restore
		}
	}
	
} else if (timer > 0) {
	timer--;
} else {	
	// TODO play restore sound
	instance_create_depth(x, y, -100, objSmokeParticle);
	visible = true;
}
