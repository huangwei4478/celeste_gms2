function appr(value, target, amount) {
	// Aproach function - increase value variable to target by amount
	// value - value
	// target - target
	// amount - amount to increase every step

	return (value > target ? max(value - amount, target) : min(value + amount, target));
}
