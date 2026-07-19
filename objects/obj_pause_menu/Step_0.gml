if global.pause_menu {
	tween(id, "image_alpha", 0.7, tween_animation.linear, 60)

} else {
	tween(id, "image_alpha", 0, tween_animation.linear, 60)
}