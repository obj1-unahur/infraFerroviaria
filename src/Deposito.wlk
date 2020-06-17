class Deposito{
	var property listaFormaciones = []
	var property listaLocomotoras = []
	
	method agregarFormacionADeposito(formacion){listaFormaciones.add(formacion)}
	method removerFormacionADeposito(formacion){listaFormaciones.remove(formacion)}
	 
	method agregarLocomotoraADeposito(locomotora){listaLocomotoras.add(locomotora)}
	method removerLocomotoraADeposito(locomotora){listaLocomotoras.remove(locomotora)}
	
	
	method conjuntoDeVagones(){
		return listaFormaciones.map({ formacion => formacion.vagonMasPesado() }).asSet()
	}
	
	method necesitaUnConductorExperimentado(){
		return listaFormaciones.any({formacion => formacion.esCompleja()})
	}
	method agregarAFormacionDeterminada(formacion){
		if(not formacion.puedeMoverse() && self.hayAlgunaLocomotoraParaUnaFormacion(formacion)){
			 	const locomotoraSuelta = listaLocomotoras.find({locomotora => locomotora.cuantoPesoPuedeArrastrar() >= formacion.kilosDeEmpujeLeFaltan()})
			 	formacion.agregarLocomotora(locomotoraSuelta)
			 	listaLocomotoras.remove(locomotoraSuelta)
		}
	}
	
	method hayAlgunaLocomotoraParaUnaFormacion(formacion){
		return listaLocomotoras.any({locomotora => locomotora.cuantoPesoPuedeArrastrar() >= formacion.kilosDeEmpujeLeFaltan()})
	}
}