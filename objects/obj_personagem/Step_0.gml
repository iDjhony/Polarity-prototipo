
/*/////////////////////////////////////
ESTADO DE VIDA DO JOGADOR
/////////////////////////////////////*/
if place_meeting(x, y, obj_nevoa) and vida > 0 {
	vida -= 20 / 60
} else if !place_meeting(x, y, obj_nevoa) and vida < 100 {
	vida += 20 / 60
}

if vida <= 0 {
	show_message("Não sobreviveu Reiniciar?")
	room_restart()
}







/*//////////////////////////////
MECANICAS DE PUXAR E/OU EMPURRAR
/////////////////////////////*/
if puxar {
	
	var _dir = point_direction(x, y, miraX, miraY)	
	var _dis = point_distance(x, y, miraX, miraY)
	
	 if tent_preso {
		var _dirTent = point_direction(x, y, tentaculoX, tentaculoY);

		n_vel_x = lengthdir_x(vel, _dirTent)
		n_vel_y = lengthdir_y(vel, _dirTent)
		
		vel_x = lerp(vel_x, n_vel_x, 0.2)
		vel_y = lerp(vel_y, n_vel_y, 0.2)
		
	} else if tentaculoComprimento < 170 {
		tentaculoComprimento += 30
	} else {
		puxar = false
	}

	if !tent_preso {
		tentaculoX = x + lengthdir_x(tentaculoComprimento, _dir)
		tentaculoY = y + lengthdir_y(tentaculoComprimento, _dir)
	}
	
	var _inst = collision_line(x, y, tentaculoX, tentaculoY, obj_modulo, false, true)
	
	if (_inst != noone){ 
		if (collision_line(x, y, tentaculoX, tentaculoY, obj_paredes, false, true) != noone){
			_inst = collision_line(x, y, tentaculoX, tentaculoY, obj_paredes, false, true)
			if _inst.puxar { tent_preso = true }
			else { puxar = false }		
		} else { puxar = false }	
	} 
	
	
	
} else if empurrar{
	
	var _dir = point_direction(x, y, miraX, miraY)	
	var _dis = point_distance(x, y, miraX, miraY)
	
	 if tent_preso and _dis < 150 {
		var _dirTent = point_direction(x, y, tentaculoX, tentaculoY);

		n_vel_x = -lengthdir_x(vel * 0.6, _dirTent)
		n_vel_y = -lengthdir_y(vel * 0.6, _dirTent)
		
		vel_x = lerp(vel_x, n_vel_x, 0.2)
		vel_y = lerp(vel_y, n_vel_y, 0.2)
		
	} else if tentaculoComprimento < 170 {
		tentaculoComprimento += 30
	} else {
		empurrar = false
	}

	if !tent_preso {
		tentaculoX = x + lengthdir_x(tentaculoComprimento, _dir)
		tentaculoY = y + lengthdir_y(tentaculoComprimento, _dir)
	}
	
	var _inst = collision_line(x, y, tentaculoX, tentaculoY, obj_modulo, false, true)
	
	if (_inst != noone){ 
		if (collision_line(x, y, tentaculoX, tentaculoY, obj_paredes, false, true) != noone){
			_inst = collision_line(x, y, tentaculoX, tentaculoY, obj_paredes, false, true)
			if _inst.empurrar { tent_preso = true }
			else { empurrar = false }		
		}  else { empurrar = false }	
	}
	
	
	var _inst = collision_line(x, y, tentaculoX, tentaculoY, obj_modulo, false, true)
	
	if (_inst != noone){
		if (collision_line(x, y, tentaculoX, tentaculoY, obj_paredes, false, true) != noone) {tent_preso = true}
		else { empurrar = false }		
	} 
	
	
} else {
	tentaculoComprimento = 0
	
	tentaculoX = x
	tentaculoY = y
	
	tent_preso = false
}


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
vel_y += gravidade





