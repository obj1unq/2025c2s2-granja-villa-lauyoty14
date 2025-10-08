import wollok.game.*
import personaje.*

class Maiz {
	var property position = null
	var property image = "corn_baby.png"
	var property valor = 150 

	method regarme() {
		image = "corn_adult.png"
	}

	method cosecharPor(personaje) {
		if(image == "corn_adult.png"){
			personaje.cosechas().add(self)
			game.removeVisual(self)
		}
	}
}

class Trigo {
	var property etapa = 0
	var property position = null
	var property valor = (etapa - 1) * 100

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_" + etapa + ".png"
	}

	method regarme() {
		if(etapa < 3){
			etapa += 1
		} else {
			etapa = 0
		}
	}

	method cosecharPor(personaje) {
		if(etapa >= 2){
			personaje.cosechas().add(self)
			game.removeVisual(self)
		}
	}
}

class Tomaco {
	var property position = null
	var property image = "tomaco.png"
	var property valor = 80

	method regarme(){
		if(game.getObjectsIn(position.up(1)).isEmpty() && 
			position.up(1).y() != game.height()){
				position = position.up(1)
		} else {
			position = game.at(position.x(), 0)
		}
	}

	method cosecharPor(personaje) {
			personaje.cosechas().add(self)
			game.removeVisual(self)
	}
}