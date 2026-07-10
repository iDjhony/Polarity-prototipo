
/*/////////////////////////////////////
ESTADO DE VIDA DO JOGADOR
/////////////////////////////////////*/
if place_meeting(x, y, obj_nevoa) and vida > 0 {
	vida -= 20 / 60
} else if !place_meeting(x, y, obj_nevoa) and vida < 100 {
	vida += 20 / 60
}

if vida <= 0 {
	show_message("Não sobreviveu! Reiniciar?")
	room_restart()
}







/*//////////////////////////////
MECANICAS DE PUXAR E/OU EMPURRAR
/////////////////////////////*/
if global.puxar and global.empurrar {
	flutuando = true
	
	vel_x = lerp(vel_x, 0, 0.03)
	vel_y = lerp(vel_y, 0, 0.03)
} else if global.puxar {
	flutuando = false
	var _dir = point_direction(x, y, global.miraX, global.miraY)
	var _dis = point_distance(x, y, global.miraX, global.miraY)

	if _dis < 200 {
		n_vel_x = lengthdir_x(vel, _dir)
		n_vel_y = lengthdir_y(vel, _dir)
	
	
		vel_x = lerp(vel_x, n_vel_x, 0.1)
		vel_y = lerp(vel_y, n_vel_y, 0.1)
	}
	
} else if global.empurrar{
	flutuando = false
	var _dir = point_direction(x, y, global.miraX, global.miraY)
	var _dis = point_distance(x, y, global.miraX, global.miraY)
	
	if _dis < 200 {
		n_vel_x = -lengthdir_x(vel * 0.6, _dir)
		n_vel_y = -lengthdir_y(vel * 0.6, _dir)
	
		vel_x = lerp(vel_x, n_vel_x, 0.1)
		vel_y = lerp(vel_y, n_vel_y, 0.1)
	}
	
} else {
	flutuando = false
}

//if flutuando {
//}

/*/////////////////////////////////
COLISÃO DE CHÃO E PAREDES
*/////////////////////////////////
if (!place_meeting(x + vel_x, y, obj_colisor)){
	x += vel_x
} else { 
	vel_x = 0
} 

if (!place_meeting(x, y + vel_y, obj_colisor)){
	y += vel_y
} else {
	vel_y = 0
	vel_x = lerp(vel_x, 0, 0.03)
}


/*//////////////////////////////////
GRAVIDADE MANUAL DO JOGO
//////////////////////////////////*/
if !flutuando { vel_y += gravidade }





