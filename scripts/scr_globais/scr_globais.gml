// Declaração de globais
global.miraX = noone
global.miraY = noone

global.puxar = false
global.empurrar = false

global.total_modulos = 0





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
	
	
	
	
	//with obj_modulo {
	//	if y > room_height {
	//		if modulo == 0 { instance_destroy() }
	//		else {
	//			x = origemx
	//			y = origemy
	//		}
	//	}
	//}
}



