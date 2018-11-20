require_relative "valoracionnutricional.rb"

class Paciente < ValoracionNutricional
	attr_reader :identificacion, :nsegsocial, :consulta, :trataobesidad

	def initialize (id , nss, consul, obseidad, name, age, gender, weight, height, circun, plieg)
		@identificacion = id
		@nsegsocial= nss
		@consulta = consul
		@trataobesidad = obseidad

		super(name, age, gender, weight, height, circun, plieg)
	end

end