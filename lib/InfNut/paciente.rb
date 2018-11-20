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