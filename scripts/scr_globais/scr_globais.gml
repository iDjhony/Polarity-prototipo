// Declaração de globais
global.miraX = noone
global.miraY = noone

global.puxar = false
global.empurrar = false

global.total_modulos = 0

global.personagem = 1

//pontos do player
global.altura_max = 0
global.pos_ref = 1216


//Controla se a névoa avança 
global.nevoa = false


//variávei da camera
global.alvo_min_y = 0
global.alvo_min_padrao = 0



//funçoes

function modulo_posX(_mod) { // retorna posição x do módulo selecionado
	with obj_origem {
		if modulo == _mod {
			return x
		}
	}
}



function modulo_posY(_mod) {   // retorna posição y do módulo selecionado
	with obj_origem {
		if modulo == _mod {
			return y
		}
	}
}


function modulo_repos() {
	with obj_origem {
		if y > room_height {
			var _m = modulo
			
			with obj_modulo {
				if modulo == 0 {
					instance_destroy()					
				} else if _m == modulo {
					x = origemx;
					y = origemy;
				}
			}
		}
	}

}

function config_camera(_mod){

	with obj_controlador { if modulo = _mod { global.alvo_min_padrao = y } }
	global.alvo_min_y = global.alvo_min_padrao
	
}

function rodar_camera(){
	var cam = view_camera[0];
	
	//suaviza o limite da camera
	
	var _alvoX = 0
	var _alvoY = obj_player.y - camera_get_view_height(cam)/2;
	
	if (global.alvo_min_y - global.alvo_min_padrao > 664) {
	global.alvo_min_y = lerp(global.alvo_min_y, global.alvo_min_padrao, 0.003)
	} else { 
		global.alvo_min_y = lerp(global.alvo_min_y, global.alvo_min_padrao, 0.02)
	} 
	var _min = global.alvo_min_y - 10;
	
	//limita a camera dentro do módulo
	_alvoY = clamp(_alvoY, _min, room_height)	
	
	//suavizar a transição da camera	
	
	camera_set_view_pos(cam, _alvoX, _alvoY)

}

function controle_altura(_y){
	var _altura = global.pos_ref - _y
	
	if _altura != 0 { _altura /= 320 }
	
	_altura = int64(_altura)
	
	_altura *= 10
	
	return _altura
}








