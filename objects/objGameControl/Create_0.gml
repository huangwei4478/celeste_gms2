/// @description Initialize the game

// should be the first object created in the game
// check if the game has been initialized
// set vars only one time, when the game begins

if (!variable_global_exists("game_initialized") || !global.game_initialized) {
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
}

// vars initialized every time room starts
paused = false;
pause_continue_selected = true;
global.hash_dashed = false;
global.has_key = false;





 
