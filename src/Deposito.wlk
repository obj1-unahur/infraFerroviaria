class Deposito{
	var property listaFormaciones = []
	var property listaLocomotoras = []
	
	method agregarFormacionADeposito(formacion){listaFormaciones.add(formacion)}
	method removerFormacionADeposito(formacion){listaFormaciones.remove(formacion)}
	 
	method agregarLocomotoraADeposito(locomotora){listaLocomotoras.add(locomotora)}
	method removerLocomotoraADeposito(locomotora){listaLocomotoras.remove(locomotora)}
	
	
	method conjuntoDeVagones(){
		var nuevaLista = []
		listaFormaciones.forEach({formacion => nuevaLista.add(formacion.vagonMasPesado())})
		return nuevaLista.asSet()
	}
	method necesitaUnConductorExperimentado(){
		return listaFormaciones.any({formacion => formacion.esCompleja()})
	}
	method agregarAFormacionDeterminada(formacion){
		if(not formacion.puedeMoverse()){
			 if(listaLocomotoras.any({locomotora => locomotora.cuantoPesoPuedeArrastrar() >= formacion.kilosDeEmpujeLeFaltan()})){
			 	var locomotoraSuelta = listaLocomotoras.find({locomotora => locomotora.cuantoPesoPuedeArrastrar() >= formacion.kilosDeEmpujeLeFaltan()})
			 	formacion.agregarLocomotora(locomotoraSuelta)
			 	listaLocomotoras.remove(locomotoraSuelta)
			 }
		}
	}
}