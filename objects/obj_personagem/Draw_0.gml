draw_self()


var _dis = point_distance(x, y, global.miraX, global.miraY)

if _dis < 200 {
	if global.puxar and global.empurrar{
		draw_line_width_colour(x, y, global.miraX, global.miraY, 2, c_fuchsia, c_purple);	
	} else if global.puxar {
		draw_line_width_colour(x, y, global.miraX, global.miraY, 2, c_blue, c_blue);
	} else if global.empurrar {
		draw_line_width_colour(x, y, global.miraX, global.miraY, 2, c_red, c_red);
	}
}




