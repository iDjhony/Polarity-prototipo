if ativei {
	if !place_meeting(x, y, obj_personagem) and y > obj_personagem.y {
		instance_create_layer(x, y, "Colisor", obj_colisor, {
			image_xscale : 2,
			image_yscale : 0.5
		});
		ativei = false
	}
}









