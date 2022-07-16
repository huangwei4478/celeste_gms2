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
	global.shake = 10;
	objGameControl.alarm[0] = 30;		// to restart room after animations
	instance_destroy();
}

on_ground = is_solid(0, 1);

if (on_ground && !was_on_ground) {
	// TODO: create smoke effects
}

jump = global.keyJump && !p_jump;
p_jump = global.keyJump;

if (jump) {
	jbuffer = 4;
} else if (jbuffer > 0) {
	jbuffer--;
}

dash = global.keyDash && !p_dash;
p_dash = global.keyDash;

if (on_ground) {
	grace = 6;
	if (djump < global.max_djump) {
		// TODO: play dash sound
		djump = global.max_djump;
	}
} else if (grace > 0) {
	grace--;
}

dash_effect_time--;		// To check collision with the fake wall
if (dash_time > 0) {
	// no control while madeline is in "dash_mode"
	// 4 steps, just dash to the position
	dash_time--;
	spdX = appr(spdX, dash_target_x, dash_accel_x);
	spdY = appr(spdY, dash_target_y, dash_accel_y);
} else {
	// move state
	maxrun = 1.0;
	accel = 0.6;
	deccel = 0.15;
	
	if (!on_ground) {
		accel = 0.4;
	} // TODO: check if madeline is on_ice, then set accel to a smaller value

	
	// if spdX excels maxrun, then slow it down
	// otherwise, speed it up
	if (abs(spdX) > maxrun) {
		spdX = appr(spdX, sign(spdX) * maxrun, deccel);
	} else {
		spdX = appr(spdX, inputX * maxrun, accel);
	}
	
	// facing
	if (spdX != 0) {
		flipX = (spdX < 0);
	}
	
	// gravity
	maxfall = 2.0;
	grav = 0.21;
	
	// if madeline is on top of the trajectory
	// slow it down by decreasing the gravity
	// which makes madeline float on-air a little bit longer
	if (abs(spdY) <= 0.15) {
		grav *= 0.5;
	}
	
	// wall slide
	if (inputX != 0 && is_solid(inputX, 0)) {
		maxfall = 0.4;		// slow down the maxfall if clinging on the wall
		// TODO: add random smoke effects
	}
	
	// spdY moves toward to maxfall, by grav
	if (!on_ground) {
		spdY = appr(spdY, maxfall, grav);
	}
	
	
	// jump
	if (jbuffer > 0) {		// if user just pressed jump button...
		if (grace > 0) {	// 1. if user just leave the edge of platform...
			// jump!
			// TODO: play jump sound
			jbuffer = 0;
			grace = 0;
			spdY = -2.0;
			// TODO: create smoke particle
		} else {
			// has jump buffer, but no grace, which means madeline trys to 
			// jump in mid-air
			// go check if she is clinged on left or right side of the wall
			
			// wall-jump has extra 2 pixel leeway, for optimizing feeling
			wall_dir = (is_solid(-3, 0) ? -1 : (is_solid(3, 0) ? 1 : 0));
			if (wall_dir != 0) {
				// TODO: play jump audio
				jbuffer = 0;
				spdY = -2.0;
				spdX = -wall_dir * (maxrun + 1.0);
				// TODO: create smoke particle if there are objBlockIce
			}
		}
	}
	
	// dash
	// dash can interrupt jump
	d_full = 5.0;
	d_half = d_full * 0.70710678118;	// sin(45) == cos(45) == sqrt(2) / 2 == 0.70710678118			
	
	if (djump > 0 && dash) {
		// madeline can dash no wnow
		
		// TODO: create smoke particles
		djump--;
		dash_time = 4;
		global.hash_dashed = true;			// detecting dash for flying fruit
		dash_effect_time = 10;				// dash effect will remain for 10 steps
		
		// if pattern-matching is available
		// the following code could be more consice
		// some trigonometry, 9 direction dashing
		if (inputX != 0) {
			if (inputY != 0) {
				spdX = inputX * d_half;
				spdY = inputY * d_half;
			} else {
				spdX = inputX * d_full;
				spdY = 0;
			}
		} else if (inputY != 0) {
			spdX = 0;
			spdY = inputY * d_full;
		} else {
			// dash toward to madeline's facing
			spdX = (flipX ? -1 : 1) * d_full;
			spdY = 0;
		}
		
		// TODO: play dash sound
		// TODO: shake screen
		global.shake = 6;
		dash_target_x = 2 * sign(spdX);
		dash_target_y = 2 * sign(spdY);
		dash_accel_x = 1.5;
		dash_accel_y = 1.5;
		
		if (spdY < 0) {
			dash_target_y *= 0.75;
		}
		
		if (spdY != 0) {
			dash_accel_x *= 0.70710678118;
		}
		
		if (spdX != 0) {
			dash_accel_y *= 0.70710678118;
		}
		
	} else if (dash && djump <= 0) {
		// out of dashes!
		// madeline wants to dash, but no dashes available
		
		// TODO: audio no dash sound
		// TODO: create smoke effects
	}
}

// animation, select action(i.e. image_index)
if (!on_ground) {
	
	// wall-climb
	if (is_solid(inputX, 0)) { image_index = 4; image_speed = 0; }
	
	// on-air
	else { image_index = 2; image_speed = 0; }
	
}
// look-up
else if (global.keyDown) { image_index = 5; image_speed = 0; }
// look-down
else if (global.keyUp) { image_index = 6; image_speed = 0; }
// idle
else if (spdX == 0 || inputX == 0) { image_index = 0; image_speed = 0; }
else {
	// move horizontally
	sprOffset += 0.25;
	if (sprOffset > 4) { sprOffset = 0.0; }
	image_index = sprOffset % 4;
}

// select sprite
if (djump == 2) {
	if ((global.step / 3) % 2) {
		sprite_index = (flipX ? s_madeline_white_left : s_madeline_white_right);
	} else {
		sprite_index = (flipX ? s_madeline_green_left : s_madeline_green_right);
	}
} else if (djump == 1) {
	sprite_index = (flipX ? s_madeline_red_left : s_madeline_red_right);
} else {
	sprite_index = (flipX ? s_madeline_blue_left : s_madeline_blue_right);
}




was_on_ground = on_ground;
