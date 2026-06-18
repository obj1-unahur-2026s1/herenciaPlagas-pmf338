import elementos.*
class Plaga{
    var property poblacion
    
    method transmiteEnfermedad(){poblacion >= 10 && self.condicionAdicional()}
    method  nivelDeDano(){} //metodo abstracto

    method condicionAdicional()

    method atacar(unElemento){
        unElemento.recibirAtaqueDe(self) //self es la plaga que ataca
        poblacion = poblacion * 1.1
    }
}


class Cucarachas inherits Plaga{
    var pesoPromedio
    override method  nivelDeDano() = poblacion / 2
    override method condicionAdicional(){
        //super()
        return pesoPromedio >= 10
        }

    override method atacar(unElemento){
        super(unElemento)
        pesoPromedio = pesoPromedio + 2
    }

}

class Pulgas inherits Plaga{

    override method  nivelDeDano() = poblacion * 2
    override method condicionAdicional() = true
}

class Garrapatas inherits Plaga{

    override method atacar(unElemento){
        unElemento.recibirAtaqueDe(self)
        poblacion = poblacion * 1.2
    }
} 

class Mosquitos inherits Plaga{
    
    override method  nivelDeDano() = poblacion
    override method transmiteEnfermedad() {poblacion % 3 == 0}
}