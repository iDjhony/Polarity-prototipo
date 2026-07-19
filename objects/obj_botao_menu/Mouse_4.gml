if !global.pause_menu {
	switch (acao) {
		case "JOGAR":
			room_goto(rm_modulos);
			break;
		case "OPCOES":
			//abrir opcoes
			global.pause_menu = true;
			//show_message(acao)
			break;
		case "SAIR":
			game_end()
			break;
		case "CREDITOS":
			//room de creditos
			show_message(acao)
			break;
	}
}














