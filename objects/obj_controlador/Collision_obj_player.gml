//obj_final
if !ativei{
	ativei = true
	var _mod = irandom_range(1, global.total_modulos); //selecionar modulo aleatório
	
	
	while (_mod == modulo) {
		_mod = irandom_range(1, global.total_modulos)
	}
	
	
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
		y += 1024
	}
	
		global.alvo_min_y += 1024
		global.pos_ref += 1024
	
	modulo_repos()
	
}





