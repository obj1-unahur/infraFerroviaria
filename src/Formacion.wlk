class Formacion {

	var property listaVagones = []
	var property listaLocomotoras = []

	method agregarAFormacion(vagon) {
		listaVagones.add(vagon)
	}

	method removerDeFormacion(vagon) {
		listaVagones.remove(vagon)
	}

	method agregarLocomotora(locomotora) {
		listaLocomotoras.add(locomotora)
	}

	method removerLocomotora(locomotora) {
		listaLocomotoras.remove(locomotora)
	}

	method pasajerosQuePuedeLlevar() {
		return listaVagones.sum({ vagon => vagon.cantidadDePasajeros() })
	}

	method vagonesPopulares() {
		return listaVagones.count({ vagon => vagon.cantidadDePasajeros() > 50 })
	}

	method formacionCarguera() {
		return listaVagones.all({ vagon => vagon.cantidadMaximaDeCarga() >= 1000 })
	}

	method pesoVagonMasPesado() {
		return self.vagonMasPesado().pesoMaximoDeVagon()
	}

	method pesoVagonMasLiviano() {
		return listaVagones.min({ vagon => vagon.pesoMaximoDeVagon() }).pesoMaximoDeVagon()
	}

	method dispercionDePesos() {
		return self.pesoVagonMasPesado() - self.pesoVagonMasLiviano()
	}

	method cantidadDeVagonesConBanios() {
		return listaVagones.count({ vagon => vagon.tieneBanios() })
	}

	method mantenimientoDeFormacion() {
		listaVagones.forEach({ vagon => vagon.mantenimientoDeVagon()})
	}

	method estaEquilibradoEnPasajeros() {
		return self.vagonConMasPasajeros().cantidadDePasajeros() <= self.vagonConMenosPasajeros().cantidadDePasajeros() + 20
	}

	method vagonesDePasajeros() {
		return listaVagones.filter({ vagon => vagon.cantidadDePasajeros() > 0 })
	}

	method vagonConMasPasajeros() {
		return self.vagonesDePasajeros().max({ vagon => vagon.cantidadDePasajeros() })
	}

	method vagonConMenosPasajeros() {
		return self.vagonesDePasajeros().min({ vagon => vagon.cantidadDePasajeros() })
	}
	
	method vagonesSinPasajeros(){
		return listaVagones.filter({ vagon => vagon.cantidadDePasajeros() == 0})
	}
	method estaOrganizado() { 
		const ordenada = []
		
		ordenada.addAll(self.vagonesDePasajeros())
		ordenada.addAll(self.vagonesSinPasajeros())
		return ordenada == listaVagones
	}

	method pesoTotalDeVagones() {
		return listaVagones.sum({ vagon => vagon.pesoMaximoDeVagon() })
	}

	method vagonMasPesado() {
		return listaVagones.max({ vagon => vagon.pesoMaximoDeVagon() })
	}

	// Etapa 2-Locomotoras
	method velocidadMaxima() {
		return listaLocomotoras.min({ locomotora => locomotora.velocidadMaxima() }).velocidadMaxima()
	}

	method esEficiente() {
		return listaLocomotoras.all({ locomotora => locomotora.locomotoraEficiente() })
	}

	method puedeMoverse() {
		return self.totalArrastreDeLocomotoras() >= self.pesoMaximoDeFormacion()
	}
	
	method totalArrastreDeLocomotoras() {
		return listaLocomotoras.sum({ locomotora => locomotora.cuantoPesoPuedeArrastrar() })
	}
	
	method pesoMaximoDeFormacion() {
		return listaLocomotoras.sum({ locomotora => locomotora.peso() }) + self.pesoTotalDeVagones()
	}

	method kilosDeEmpujeLeFaltan() {
		return if (self.puedeMoverse()) {
			0
		} else {
			self.pesoMaximoDeFormacion() - self.totalArrastreDeLocomotoras()
		}
	}

	//
	method esCompleja() {
		return listaLocomotoras.size() + listaVagones.size() > 8 or self.pesoMaximoDeFormacion() > 80000
	}

}

