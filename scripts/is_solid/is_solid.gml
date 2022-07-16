function is_solid(_x, _y){
	// is_solid function - check for collision on space
	
	// check platform first
	if (x > 0 && !place_meeting(x + _x, y, objPlatform)
			  && place_meeting(x + _x, y + _y, objPlatform)) {
		return true;		  
	}
	
	return !place_free(x + _x, y + _y);
}