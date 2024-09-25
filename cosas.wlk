object knightRider {
    method peso() = 500
    method peligrosidad() = 10 
    method bultos() = 1
}

object bumblebee {
    var estaTransformado = false
    method peso() = 800
    method peligrosidad() = if (!estaTransformado) 15 else 30
    method transformarse() {
        estaTransformado = !estaTransformado
    }
    method bultos() = 2
}

object ladrillos {
    var property cantidad = 0
    method peso() = 2 * cantidad
    method peligrosidad() = 2
    method bultos() {
        if (cantidad.between(0, 100)) return 1
        if (cantidad.between(101, 300)) return 2
        return 3
    }
}

object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 1
    method bultos() = 1
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method peso() = if (tieneMisiles) 300 else 200
    method peligrosidad() = if (tieneMisiles) 100 else 0
    method cargarMisiles(){
        tieneMisiles = true
    }
    method descargarMisiles() {
        tieneMisiles = false
    }
    method bultos() {
        if(tieneMisiles) 2 else 1
    }
}

object contenedorPortuario {
    const cosas = []
    method peso() {
        return 100 + cosas.sum({ c => c.peso() })
    }
    method agregarCosas(unaCosa) {
        cosas.add(unaCosa)
    }
    method peligrosidad() {
        if (cosas.isEmply()) return 0
        return cosas.max({ c => c.peligrosidad()}).peligrosidad()
    }
    method bultos() {
        return 1 + cosas.sum({ c => c.bultos()})
    }
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = cosaNulleable
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
    method bultos() = 2
}

object cosaNulleable {
    method peso() = 0
    method peligrosidad() = 0
}