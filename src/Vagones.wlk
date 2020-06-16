
class VagonPasajeros{
	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	var cantidadPasajeros = 0
	
	method cantidadDePasajeros(){
		if(ancho <= 3){
		 	cantidadPasajeros = 8 * largo
		}
		else{
			cantidadPasajeros = 10 * largo
		}
		if(not estaOrdenado){
			cantidadPasajeros -= 15
		}
		return cantidadPasajeros
	}
	
	method cantidadMaximaDeCarga(){
		if(tieneBanios){
			return 300
		}
		else{
			return 800
		}
	}
	
	method pesoMaximoDeVagon(){
		return 2000 + (80 * cantidadPasajeros) + self.cantidadMaximaDeCarga()
	}
	method mantenimientoDeVagon(){estaOrdenado = true}
}
class VagonDeCarga{
	var property cargaMaximaIdeal
	var property maderasSueltas
	
	method tieneBanios(){return false}
	method cantidadDePasajeros(){return 0}
	method cantidadMaximaDeCarga(){return cargaMaximaIdeal - (400 * maderasSueltas)}
	method pesoMaximoDeVagon(){return 1500 + self.cantidadMaximaDeCarga()}
	method mantenimientoDeVagon(){maderasSueltas = (maderasSueltas - 2).max(0)}
}
class VagonDormitorio{
	var property cantidadCompartimientos
	var property cantidadDeCamasEnCompartimiento
	
	method tieneBanios(){return true}
	method cantidadDePasajeros(){return cantidadCompartimientos * cantidadDeCamasEnCompartimiento}
	method cantidadMaximaDeCarga(){return 1200}
	method pesoMaximoDeVagon(){return 4000 + (80*self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()}
	method mantenimientoDeVagon(){}
}