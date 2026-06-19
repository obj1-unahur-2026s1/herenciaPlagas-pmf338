import plagas.*

class Hogar {
  var property nivelMugre
  var property confort

  method esBueno() = nivelMugre <= confort / 2

  method recibirAtaqueDe(plaga) {
    nivelMugre = nivelMugre + plaga.nivelDeDano()
  }
}

object nivelDeCosechas {
  var property valor = 10
}

class Huerta {
  var property capDeProd

  method esBueno() = capDeProd > nivelDeCosechas.valor()

  method recibirAtaqueDe(plaga) {
    capDeProd = capDeProd - plaga.nivelDeDano() * 0.10
    if (plaga.transmiteEnfermedad()) {
      capDeProd = capDeProd - 10
    }
  }
}

class Mascota {
  var property nivelDeSalud

  method esBueno() = nivelDeSalud > 250

  method recibirAtaqueDe(plaga) {
    if (plaga.transmiteEnfermedad()) {
      nivelDeSalud = nivelDeSalud - plaga.nivelDeDano()
    }
  }
}

class Barrio {
  const elementos = []

  method elementos() = elementos

  method agregarElemento(elemento) { elementos.add(elemento) }

  method esCopado() = elementos.count({e => e.esBueno()}) > elementos.count({e => !e.esBueno()})
}