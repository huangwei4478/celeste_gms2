// Inherit the parent event
event_inherited();

image_speed = 0;

inputX = 0;			// global.keyRight - global.keyLeft
inputY = 0;			// global.keyDown - global.keyUp

previous_was_jump = false;
previous_was_dash = false;

edge_grace = 0;
jump_buffer = 0;

djump = global.max_djump;

dash_time = 0;
dash_effect_time = 0;

dash_target_x = 0.0;
dash_target_y = 0.0;

dash_accel_x = 0.0;
dash_accel_y = 0.0;

was_on_ground = false;
on_ground = false;
on_ice = false;

valid_dash = false;
valid_jump = false;

maxrun = 0.0;
accel = 0.0;
deccel = 0.0;

maxfall = 0.0;
grav = 0.0;

wall_dir = 0;

dash_full = 0.0;
dash_half = 0.0;

movingSprOffset = 0.0;













