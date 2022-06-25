if (global.pause_player) return;

// Inherit the parent event
event_inherited();

// Keep player inside room on x axis
if (x < -1) { x = -1; spdX = 0; }
else if (x > 121) { x = 121; spdX = 0; }

inputX = global.keyRight - global.keyLeft;
inputY = global.keyDown - global.keyUp;

// TODO: spikes meeting
if (y > 128) { 	// fall causes player death
	// kill player
	
	objGameControl.alarm[0] = 30;
	instance_destroy();
}

on_ground = is_solid(0, 1);


// TODO...

was_on_ground = on_ground;
