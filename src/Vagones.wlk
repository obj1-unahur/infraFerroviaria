class VagonPasajeros {

	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado

	method cantidadDePasajeros() {
		const cuantoRestar =  if(not estaOrdenado){ 15} else {0}
		var cantidadDePasajeros = 0
		
		if (ancho <= 3) {
			cantidadDePasajeros = 8 * largo
		} else {
			cantidadDePasajeros = 10 * largo
		}
		
		return cantidadDePasajeros - cuantoRestar
//		esto se podría hacer en una sola línea
// 		return cantidadPasajeros - if(not estaOrdenado){ 15} else {0}
	}

	method cantidadMaximaDeCarga() {
		const cuantoSumar = if(not tieneBanios){500} else {0}
		return 300 + cuantoSumar
//		Acá se puede hacer lo mismo que en cantidad de pasajeros
//		return 300 + if(tieneBanios){500} else {0}
		
	}

	method pesoMaximoDeVagon() {
		return 2000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	}

	method mantenimientoDeVagon() {
		estaOrdenado = true
	}

}

class VagonDeCarga {

	var property cargaMaximaIdeal
	var property maderasSueltas

	method tieneBanios() {
		return false
	}

	method cantidadDePasajeros() {
		return 0
	}

	method cantidadMaximaDeCarga() {
		return cargaMaximaIdeal - (400 * maderasSueltas)
	}

	method pesoMaximoDeVagon() {
		return 1500 + self.cantidadMaximaDeCarga()
	}

	method mantenimientoDeVagon() {
		maderasSueltas = 0.max(maderasSueltas - 2)
	}

}

class VagonDormitorio {

	var property cantidadCompartimientos
	var property cantidadDeCamasEnCompartimiento

	method tieneBanios() {
		return true
	}

	method cantidadDePasajeros() {
		return cantidadCompartimientos * cantidadDeCamasEnCompartimiento
	}

	method cantidadMaximaDeCarga() {
		return 1200
	}

	method pesoMaximoDeVagon() {
		return 4000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	}

	method mantenimientoDeVagon() {
	}

}

