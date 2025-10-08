import wollok.game.*
import personaje.*
import cultivos.*

class Aspersor {
    var property image = "aspersor.png"
    var property position = null  
    var property direcciones = [
        game.at(position.x(), position.y() + 1),
        game.at(position.x() + 1, position.y() + 1),
        game.at(position.x() + 1, position.y()),
        game.at(position.x() + 1, position.y() - 1),
        game.at(position.x(), position.y() - 1),
        game.at(position.x() - 1, position.y() - 1),
        game.at(position.x() - 1, position.y()),
        game.at(position.x() - 1, position.y() + 1)
    ]

    method regarCultivos() {
        const posicionIncial = position
        direcciones.forEach({direccion => self.regarEn(direccion)})
        position = posicionIncial
    }

    method regarEn(direccion) {
        position = direccion		
        if (self.hayPlantaAca()) {
            self.plantaActual().regarme()		
        }
    }

    method plantaActual() {
	  	const cultivosEnMiPosition = game.getObjectsIn(position)
        cultivosEnMiPosition.remove(self)
        cultivosEnMiPosition.remove(personaje)
		return cultivosEnMiPosition.first()
	}

    method hayPlantaAca() {
		const cultivosEnMiPosition = game.getObjectsIn(position)
		cultivosEnMiPosition.remove(self)
        cultivosEnMiPosition.remove(personaje)
		return not cultivosEnMiPosition.isEmpty()
	}
}