import plagas.*

class Hogar{
    var property nivelMugre
    var property confort
    var nivelDeMugre = 0 

    method esBueno(){nivelMugre >= confort} 
    method nivelDeMugre(unaPlaga) = nivelDeMugre + unaPlaga.nivelDeDano()

    method recibirAtaqueDe(unaPlaga){
        nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDano()
    }
}

class Huerta{
    var property capDeProd

    method esBueno() = capDeProd > nivelDeCosechas.valor()
    method capDeProd(unaPlaga){
        if(unaPlaga.transmiteEnfermedad()){
            capDeProd = (capDeProd - (unaPlaga.nivelDeDano() * 0.10)) - 10
        }else{
            capDeProd = capDeProd - (unaPlaga.nivelDeDano() * 0.10)
        }
    }
}

object nivelDeCosechas{
    var property valor = 10
}

class Mascota{
    var property nivelDeSalud

    method esBueno(){nivelDeSalud > 250}
    method nivelDeSalud(unaPlaga){
        if(unaPlaga.transmiteEnfermedad()){
           return nivelDeSalud - unaPlaga.nivelDeDano()  //CAMBIAR
        }else{
           return nivelDeSalud
        }
    }
}

class Barrio{
    const elementos = []

    method esCopado(){
        return (elementos.count({c => c.esBueno()}) > elementos.count({c => !(c.esBueno())}))
    }
}