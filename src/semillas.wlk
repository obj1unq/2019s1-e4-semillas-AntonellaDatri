class Plantas {

	method horasDeSolToleradas(){
		return 0
	}
	method esFuerte(){
		return self.horasDeSolToleradas() > 10
	}
	method daNuevasSemillas(){
		return self.esFuerte() || self.alternativa()
	}
	method alternativa(){
		return false
	}
}

class Menta inherits Plantas{
	var property anioDeObtencion
	var property altura 
	
	override method horasDeSolToleradas(){
		return 6
	}
	method esplacioOcupado(){
		return altura * 3
	}
	override method alternativa(){
		return altura > 0.4
	}
	method esIdeal(parcela){
		return parcela.superficie() > 6
	} 
}

class Soja inherits Plantas{
	var property anioDeObtencion
	var property altura 
	
	override method horasDeSolToleradas(){
		if(altura < 0.5){ return 6 }
		else if(altura >= 0.5 && altura <= 1 ) { return 7 }	
		else {return 9}
	}
	method esplacioOcupado(){
		return altura / 2
	}
	override method alternativa(){
		return (altura > 1) && (anioDeObtencion > 2007)
	}
	method esIdeal(parcela){
		return parcela.horasDeSol() == self.horasDeSolToleradas()
	}
}

class Quinoa inherits Plantas{
	var property anioDeObtencion
	var property altura 
	var property horasDeSol
	
	override method horasDeSolToleradas(){
		return horasDeSol
	}
	method esplacioOcupado(){
		return 0.5
	}
	override method alternativa(){
		return  anioDeObtencion < 2005
	}
	method esIdeal(parcela){
		return parcela.plantas().all({ planta => planta.altura() <= 1.5 })
	}
}


class SojaTransgenica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	override method esIdeal(parcela){
		return parcela.cantMaxDePlantas() == 1
	}
}

class Hierbabuena inherits Menta{
	override method esplacioOcupado(){
		return altura * 6
	}
} 	







