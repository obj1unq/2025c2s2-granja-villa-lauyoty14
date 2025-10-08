import wollok.vm.*
import cultivos.*
import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property cosechas = []
	const cultivos = []

	method dineroDeVenta() {
		var dinero = 0
		cosechas.forEach({cosecha => dinero += cosecha.valor()})
		return dinero
	}

	method text() = self.plantasParaVender()

	method plantasParaVender() {
		return "tengo" + self.dineroDeVenta() + ", y" + cosechas.length() + "para vender"
	}

	method cosechar() {
		self.validarCosechar()
		self.plantaActual().cosecharPor(self)
	}

	method validarCosechar() {
		if(not self.hayPlantaAca()){
			self.error("no hay una planta para cosechar en la celda actual")
		}
	}

	method plantaActual() {
	  	const cultivosEnMiPosition = game.getObjectsIn(position)
		cultivosEnMiPosition.remove(self)
		return cultivosEnMiPosition.first()
	}

	method sembrarTrigo() {
		self.validarSembrar()
		const trigoNuevo = new Trigo(position = self.position())
		cultivos.add(trigoNuevo)
		game.addVisual(trigoNuevo)
	}

	method sembrarMaiz() {
		self.validarSembrar()
		const trigoNuevo = new Maiz(position = self.position())
		cultivos.add(trigoNuevo)
		game.addVisual(trigoNuevo)
	}

	method sembrarTomaco() {
		self.validarSembrar()
		const trigoNuevo = new Tomaco(position = self.position())
		cultivos.add(trigoNuevo)
		game.addVisual(trigoNuevo)
	}

	method validarSembrar() {
		if(self.hayPlantaAca()){
			self.error("no puede haber dos plantas en la misma celda")
		}
	}

	method hayPlantaAca() {
		const cultivosEnMiPosition = game.getObjectsIn(position)
		cultivosEnMiPosition.remove(self)
		return not cultivosEnMiPosition.isEmpty()
	}

	method regar() {
		self.validarRegar()
		self.plantaActual().regarme()		
	}

	method validarRegar() {
		if(not self.hayPlantaAca()){
			self.error("no tengo nada para regar")
		}
	}
}