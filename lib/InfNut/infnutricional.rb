class InformacionNutricional

	include Comparable

	attr_accessor :nombre, :porciones, :valorenergetico, :grasa, :grasasaturada, :hidratos, :azucar, :proteinas, :sal, :IR

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

	def calculoIR
		@IR = InformacionNutricional.new("I.R", 1, [8400, 2000], 70, 20, 260, 90, 50, 6)

		vectoraux = []
		vectoraux2 = []
		aux = (calculokJ * 100)/ @IR.valorenergetico[0]
		aux = aux.round(2)
		vectoraux2.push(aux)
		aux = (calculokCal * 100)/ @IR.valorenergetico[1]
		aux = aux.round(2)
		vectoraux2.push(aux)
		vectoraux.push(vectoraux2)
		aux = (calculoGrasa * 100)/ @IR.grasa
		aux = aux.round(2)
		vectoraux.push(aux)
		aux = (calculoGrasaSaturada * 100)/ @IR.grasasaturada
		aux = aux.round(2)
		vectoraux.push(aux)
		aux = (calculoHidratos * 100)/ @IR.hidratos
		aux = aux.round(2)
		vectoraux.push(aux)
		aux = (calculoAzucar * 100)/ @IR.azucar
		aux = aux.round(2)
		vectoraux.push(aux)
		aux = (calculoProteinas * 100)/ @IR.proteinas
		aux = aux.round(2)
		vectoraux.push(aux)
		aux = (calculoSal * 100)/ @IR.sal
		aux = aux.round(2)
		vectoraux.push(aux)

		vectoraux
	end

	def to_s
		calculoIR.to_s
	end

end
