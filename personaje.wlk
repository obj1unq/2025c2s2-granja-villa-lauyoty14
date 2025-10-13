import wollok.vm.*
import cultivos.*
import wollok.game.*
import aspersor.*


object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivos = []
	var property cosechas = []
	var property dinero = 0 
	const property aspersores = []

	method activarAspersores() {
	  aspersores.forEach({aspersor => aspersor.regarCultivos()})
	}

	method añadirAspersor() {
		const nuevoAspersor = new Aspersor(position = self.position()) 
		aspersores.add(nuevoAspersor)
		game.addVisual(nuevoAspersor)
	}

	method dineroDeVenta() {
		var dineroDeVenta = 0
		cosechas.forEach({cosecha => dineroDeVenta += cosecha.valor()})
		return dineroDeVenta
	}

	method plantasParaVender() {
		game.say(self, "tengo " + self.dineroDeVenta() + ", y " + cosechas.size() + " para vender")
	} 

	method vender() {
		dinero += self.dineroDeVenta()
		self.cosechas([])
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
