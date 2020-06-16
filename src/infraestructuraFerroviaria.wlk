class Formacion{
	var property listaVagones = []
	var property listaLocomotoras = []
	
	method agregarAFormacion(vagon){listaVagones.add(vagon)}
	method removerDeFormacion(vagon){listaVagones.remove(vagon)}
	method agregarLocomotora(locomotora){listaLocomotoras.add(locomotora)}
	method removerLocomotora(locomotora){listaLocomotoras.remove(locomotora)}
	
	method pasajerosQuePuedeLlevar(){
		return listaVagones.sum({vagon => vagon.cantidadDePasajeros()})
	}
	method vagonesPopulares(){
		return listaVagones.count({vagon => vagon.cantidadDePasajeros() > 50})
	}
	method formacionCarguera(){
		return listaVagones.all({vagon => vagon.cantidadMaximaDeCarga() >= 1000})
	}
	method pesoVagonMasPesado(){
		return listaVagones.max({vagon => vagon.pesoMaximoDeVagon()}).pesoMaximoDeVagon()
	}
	method pesoVagonMasLiviano(){
		return listaVagones.min({vagon => vagon.pesoMaximoDeVagon()}).pesoMaximoDeVagon()
	}
	method dispercionDePesos(){
		return self.pesoVagonMasPesado() - self.pesoVagonMasLiviano() 
	}
	method cantidadDeVagonesConBanios(){
		return listaVagones.count({vagon => vagon.tieneBanios()})
	}
	method mantenimientoDeFormacion(){
		listaVagones.forEach({vagon => vagon.mantenimientoDeVagon()})
	}
	method estaEquilibradoEnPasajeros(){//condicion se deben descartar los vagones que no llevan pasajeros
		var nuevaLista = listaVagones.filter({vagon => vagon.cantidadDePasajeros() > 0})
		return nuevaLista.max({vagon => vagon.cantidadDePasajeros()}).cantidadDePasajeros() <= 
		nuevaLista.min({vagon => vagon.cantidadDePasajeros()}).cantidadDePasajeros() + 20
	}
	method estaOrganizado(){
		return listaVagones.sortedBy({vagonA,vagonB => vagonA.cantidadDePasajeros() > 0 
			and vagonB.cantidadDePasajeros() == 0}) == listaVagones
	}
	method pesoTotalDeVagones(){
		return listaVagones.sum({vagon => vagon.pesoMaximoDeVagon()})
	}
	method vagonMasPesado(){
		return listaVagones.max({vagon => vagon.pesoMaximoDeVagon()})
	}
	
	//Etapa 2-Locomotoras
	method velocidadMaxima(){
		return listaLocomotoras.min({locomotora => locomotora.velocidadMaxima()}).velocidadMaxima()
	}
	method esEficiente(){
		return listaLocomotoras.all({locomotora => locomotora.locomotoraEficiente()})
	}
	method pesoMaximoDeFormacion(){
		return listaLocomotoras.sum({locomotora => locomotora.peso()}) + self.pesoTotalDeVagones()
		
	}
	method totalArrastreDeLocomotoras(){
		return listaLocomotoras.sum({locomotora => locomotora.cuantoPesoPuedeArrastrar()})
	}
	method puedeMoverse(){
		return self.totalArrastreDeLocomotoras() >= self.pesoMaximoDeFormacion()
	}
	method kilosDeEmpujeLeFaltan(){
		if(self.puedeMoverse()){
			return 0
		}
		else{
			return self.pesoMaximoDeFormacion() - self.totalArrastreDeLocomotoras()
		}
	}
	
	//
	method esCompleja(){
		return listaLocomotoras.size() + listaVagones.size() > 8 
		or self.pesoMaximoDeFormacion() > 80000
	}
}

