
//image_alpha = 0

//salvando as escalas originais do botão;
xscale = image_xscale;
yscale = image_yscale;
angle = image_angle;



// quanto aumenta sobre as escalas do botão
escala_sobre = 1.5

//escala do texto
escala_string = 1




//chacolhar o botão
treme = false


//funções do botão//

//função que treme o botão
function anim_botao(){ treme = !treme }

//função que aumenta o botão e as letras
function aum_botao(){
	tween(id, "image_xscale", xscale * escala_sobre, tween_animation.bounce, 30)
	tween(id, "image_yscale", yscale * escala_sobre, tween_animation.elastic, 30)

	tween(id, "escala_string",  1.8, tween_animation.bounce, 10)
}

//função que diminui o botao
function dim_botao(){
	
	tween(id, "image_xscale", xscale, tween_animation.bounce, 30)
	tween(id, "image_yscale", yscale, tween_animation.bounce, 30)

	tween(id, "escala_string", 1, tween_animation.bounce, 10)

}








