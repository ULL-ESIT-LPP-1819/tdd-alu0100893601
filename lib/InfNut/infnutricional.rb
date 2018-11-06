class InformacionNutricional

	attr_accessor :nombre, :porciones, :valorenergetico, :grasa, :grasasaturada, :hidratos, :azucar, :proteinas, :sal

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

	def calculokJ 
		@valorenergetico[0]*porciones
	end

	def calculokCal 
		@valorenergetico[1]*porciones
	end

	def calculoGrasa
		@grasa*porciones
	end

	def calculoGrasaSaturada
		@grasasaturada*porciones
	end

	def calculoHidratos
		@hidratos*porciones
	end

	def calculoAzucar
		@azucar*porciones
	end

	def calculoProteinas
		@proteinas*porciones
	end

	def calculoSal
		@sal*porciones
	end

end
