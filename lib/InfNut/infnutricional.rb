class InformacionNutricional

	attr_accessor :nombre, :valorenergetico, :grasa, :grasasaturada, :hidratos, :azucar, :proteinas, :sal

	def initialize (name, portions, energeticValue, fat, saturedFat, carbohydrates, sugar, protein, salt)
		@nombre = name
		@porciones = portions
		@valorenergetico = energeticValue
		@grasa = fat
		@grasasaturada = saturedFat
		@hidratos = carbohydrates
		@azucar = sugar
		@proteinas = protein
		@sal = salt
	end

end
