




var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
var _pause_menu = global.pause_menu


//tentativa de chacoalhar o botão
if _mouse_sobre and !_pause_menu{
	
	aum_botao()
	
	if treme {
		tween(id, "image_angle", angle + 7, tween_animation.bounce, 10, anim_botao)
	} else {
		tween(id, "image_angle", angle - 7, tween_animation.bounce, 10, anim_botao)
	}
} else {
	image_angle = angle;
	dim_botao()
}








