
var _dis = point_distance(x, y, tentaculoX, tentaculoY)

if puxar and _dis < 200 {
	draw_line_width_colour(x, y, tentaculoX, tentaculoY, 2, c_blue, c_blue);
} else if empurrar and _dis < 200 {
	draw_line_width_colour(x, y, tentaculoX, tentaculoY, 2, c_red, c_red);
}

draw_self()


