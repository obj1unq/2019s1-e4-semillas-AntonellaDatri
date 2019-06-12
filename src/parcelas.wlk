class Parcela {
	var property largo
	var property ancho
	var property horasDeSol
	var property plantas = []
	var property esEcologica
	
	
	method superficie(){
		return largo * ancho
	}	
	method cantMaxDePlantas(){
		if ( largo < ancho ){ return self.superficie() / 5 }
		else{ return self.superficie() / 3 + largo }
	}
	method tieneComplicaciones(){
		return plantas.any({ planta => planta.horasDeSolToleradas() < horasDeSol }) 
			   || plantas.isEmpty()
	}
	method plantarUnaPlanta(planta){
		if(not self.sePuedePlantar(planta)){
			self.error( "no se puede plantar esta planta")
		}
		plantas.add(planta)
	}
	method sePuedePlantar(planta){
		return self.noHayLugarEnParcela() && not self.laParcelaRecimeMasSolQue(planta)
	}
	method noHayLugarEnParcela(){
		return plantas.size() < self.cantMaxDePlantas()
	}
	method laParcelaRecimeMasSolQue(planta){
		return planta.horasDeSolToleradas() + 2 <= horasDeSol
	}
	method esCompatibleCon(planta){
		if(esEcologica){
			return self.tieneComplicaciones() && planta.esIdeal(self)
		} 
		else{
			return plantas.size() <=2 && planta.esFuerte() 
		}
	}
	method cantPlantasBienAso(){
		return plantas.filter({ planta => self.esCompatibleCon(planta) }).size()
	}
}




