function is_solid(_x, _y){
	// is_solid function - check for collision on space
	return !place_free(x + _x, y + _y);
}