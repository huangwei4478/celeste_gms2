/// @description Initialize the game

// should be the first object created in the game
// check if the game has been initialized
// set vars only one time, when the game begins

// if (!variable_global_exists("game_initialized") || !global.game_initialized) {
global.leftKey = vk_left;
global.rightKey = vk_right;
global.upKey = vk_up;
global.downKey = vk_down;
global.jumpKey = ord("Z");
global.dashKey = ord("X");
global.pauseKey = vk_enter;
	
	
global.game_initialized = true;
	
global.step = 0;
global.pause_player = false;
global.shake = 0;
global.max_djump = 1;
// }

// vars initialized every time room starts
paused = false;
pause_continue_selected = true;
global.hash_dashed = false;
global.has_key = false;

// PICO-8 color palette
global.palette = [
	make_color_rgb(0, 0, 0),		// 0 - black
	make_color_rgb(29, 43, 83),		// 1 - dark blue
	make_color_rgb(126, 37, 83),	// 2 - dark purple
	make_color_rgb(0, 135, 81),		// 3 - dark green
	make_color_rgb(171, 82, 54),	// 4 - brown
	make_color_rgb(95, 87, 79),		// 5 - dark grey
	make_color_rgb(194, 195, 199),	// 6 - light grey
	make_color_rgb(255, 241, 232),	// 7 - white
	make_color_rgb(255, 0, 77),		// 8 - red
	make_color_rgb(255, 163, 0	),	// 9 - orange
	make_color_rgb(255, 236, 39),	// 10 - yellow
	make_color_rgb(0, 228, 54),		// 11 - green
	make_color_rgb(41, 173, 255),	// 12 - blue
	make_color_rgb(131, 118, 156),	// 13 - lavender
	make_color_rgb(255, 119, 168),	// 14 - pink
	make_color_rgb(255, 204, 170)	// 15 -light peach
];

room_goto_next();




 
