/// @description Input check

global.keyLeft = keyboard_check(global.leftKey);
global.keyRight = keyboard_check(global.rightKey);
global.keyUp = keyboard_check(global.upKey);
global.keyDown = keyboard_check(global.downKey);
global.keyJump = keyboard_check(global.jumpKey);
global.keyDash = keyboard_check(global.dashKey);
global.keyPause = keyboard_check(global.pauseKey);

global.keyLeftPressed = keyboard_check_pressed(global.leftKey);
global.keyRightPressed = keyboard_check_pressed(global.rightKey);
global.keyUpPressed = keyboard_check_pressed(global.upKey);
global.keyDownPressed = keyboard_check_pressed(global.downKey);
global.keyJumpPressed = keyboard_check_pressed(global.jumpKey);
global.keyDashPressed = keyboard_check_pressed(global.dashKey);
global.keyPausePressed = keyboard_check_pressed(global.pauseKey);

global.step = ((global.step + 1) % 30);



