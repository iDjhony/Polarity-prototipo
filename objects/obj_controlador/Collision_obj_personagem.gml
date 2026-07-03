//obj_final
if !ativei{
	ativei = true
	var _mod = 1
	var _destinoX = x
	var _destinoY = y

	var posX = modulo_posX(_mod)
	var posY = modulo_posY(_mod)
	
	var newX = _destinoX - posX
	var newY = _destinoY - posY
	
	with obj_modulo {
		if modulo == _mod {
			x += newX;
			y += newY;
		}
	}
	
	with all {
		y += 1056
	}

	show_debug_message("encostei")

	
}





