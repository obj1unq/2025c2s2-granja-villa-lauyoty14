import personaje.*
import wollok.game.*

class Mercado {
    var property image = "market.png"
    var property position
    var property monedas
    var property mercaderia = []  

    method hayAlguienAca() = game.onSameCell(position, personaje.position()) 

    method comprar(cosechas, costo) {
      mercaderia.add(cosechas)
      monedas -= costo
    }
}

const mercado1 = new Mercado(position = game.at(9, 0.randomUpTo(9)), 
                              monedas = 100) 

const mercado2 = new Mercado(position = game.at(9, 0.randomUpTo(9)), 
                              monedas = 200) 

const mercado3 = new Mercado(position = game.at(9, 0.randomUpTo(9)), 
                              monedas = 300) 


const mercaditos = [mercado1, mercado2, mercado3]