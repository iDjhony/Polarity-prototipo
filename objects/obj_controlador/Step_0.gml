if ativei {
	if !place_meeting(x, y, obj_player) and y > obj_player.y {
		global.nevoa = true
		
		instance_create_layer(x, y, "Colisor", obj_colisor, {
			image_xscale : 2,
			image_yscale : 0.5
		});
		ativei = false
	}
}

//show_debug_message("Modulo: " + string(modulo) + " y: " + string(y))







