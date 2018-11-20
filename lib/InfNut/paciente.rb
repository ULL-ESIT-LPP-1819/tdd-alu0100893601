require_relative "valoracionnutricional.rb"

class Paciente < ValoracionNutricional
	attr_reader :identificacion, :nsegsocial

	def initialize (id , nss, name, age, gender, weight, height, circun, plieg)
		@identificacion = id
		@nsegsocial= nss

		super(name, age, gender, weight, height, circun, plieg)
	end

end

class Consulta < Paciente

	attr_reader :cita

	def initialize (consul, id , nss, name, age, gender, weight, height, circun, plieg)
		@cita = consul

		super(id , nss, name, age, gender, weight, height, circun, plieg)
	end
	
end

class TratarObesidad < Paciente

	attr_reader :obesidad

	def initialize (obe, id , nss, name, age, gender, weight, height, circun, plieg)
		@obesidad = obe

		super(id , nss, name, age, gender, weight, height, circun, plieg)
	end

	def calcularTratoDeObesidad
		aux = evaluar_imc
		#puts aux

		if aux=="Obesidad 1"
			@obesidad = true
		elsif aux=="Obesidad 2"
			@obesidad = true
		elsif aux=="Obesidad 3"
			@obesidad = true
		end

		aux2 = @obesidad
		aux2
	end
	
end