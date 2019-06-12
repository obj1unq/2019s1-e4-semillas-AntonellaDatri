object inta {
	var property parcelas = []
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	method promedioDePlantas(){
		return self.sumaDePlantasDeParcelas() / parcelas.size()
	}
	method sumaDePlantasDeParcelas(){
		return parcelas.sum({ parcela => parcela.plantas().size() })
	}
	method parcelaMasAutosustentable(){
		return self.parcelasConMasDe4Plantas().max({ parcela => parcela.cantPlantasBienAso() })
	}
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({ parcela => parcela.plantas().size() > 4 })
	}
}
