import cosas.*


object camion {
    const cosas = []
    method cargar(unaCosa) {
      cosas.add(unaCosa)
      unaCosa.consecuencia()
    }
    method descargar(unaCosa) {
      cosas.remove(unaCosa)
    }
    method sonNumerosImpares() {
      return cosas.all({c =>c.peso().odd()})
    }
    method cosasQuePesa(unValor) {
      return cosas.any({c => c.peso() == unValor})
    }
    method nivelPeligrosidad(unNivelPeligrosidad) {
      return cosas.find({c => c.peligrosidad() == unNivelPeligrosidad})
    }
    method cosasQueSuperan(unNivelPeligrosidad) {
      return cosas.filter({c => c.peligrosidad() > unNivelPeligrosidad})
    }
    method cosasQueSuperanA(unaCosa) {
      return self.cosasQueSuperan(unaCosa.peligrosidad())
    }
    method estaExcedido() {
      return self.peso() > 2500
    }
    method puedeCircular(unNivelPeligrosidad) {
      return !self.estaExcedido() and self.todasSonMenosPeligrosas(unNivelPeligrosidad)
    }
    method todasSonMenosPeligrosas(unNivelPeligrosidad) {
      return cosas.all({ c => c.peligrosidad() < unNivelPeligrosidad })
    }
    method peso() {
        return 1000 + cosas.sum({c => c.peso()})
    } 
}