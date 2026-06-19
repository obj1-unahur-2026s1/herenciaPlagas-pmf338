import elementos.*

class Plaga {
  var property poblacion

  method transmiteEnfermedad() = poblacion >= 10 && self.condicionAdicional()

  method nivelDeDano()         
  method condicionAdicional()  

  method porcentajeDeCrecimiento() = 1.1

  method atacar(elemento) {
    elemento.recibirAtaqueDe(self)
    poblacion = poblacion * self.porcentajeDeCrecimiento()
  }
}

class Cucarachas inherits Plaga {
  var property pesoPromedio

  override method nivelDeDano() = poblacion / 2
  override method condicionAdicional() = pesoPromedio >= 10

  override method atacar(elemento) {
    super(elemento)
    pesoPromedio = pesoPromedio + 2
  }
}

class Pulgas inherits Plaga {
  override method nivelDeDano() = poblacion * 2
  override method condicionAdicional() = true
}

class Garrapatas inherits Pulgas {
  override method porcentajeDeCrecimiento() = 1.2
}

class Mosquitos inherits Plaga {
  override method nivelDeDano() = poblacion
  override method condicionAdicional() {poblacion % 3 == 0}
}