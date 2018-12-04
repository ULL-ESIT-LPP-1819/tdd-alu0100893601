class ValoracionNutricional

	include Comparable

	attr_reader :nombre, :edad, :genero, :peso, :talla, :circunferencias, :pliegues

	def initialize (name, age, gender, weight, height, circun, plieg)
		@nombre = name
		@edad = age
		@genero = gender
		@peso = weight
		@talla = height
		@circunferencias = circun
		@pliegues = plieg
	end

	def <=> (other)
		calcular_imc <=> other.calcular_imc
	end

	def to_s
		"Nombre: #{@nombre}, #{@edad}"
	end

	def calcular_imc
		@imc = (@peso / (@talla * @talla))
		@imc = @imc.round(2)
		@imc
	end

	def calcular_xgrasa
		calcular_imc

		if @genero=="masculino"
			@grasa = (1.2 * @imc + 0.23 * @edad - 10.8 - 5.4)
		else
			@grasa = (1.2 * @imc + 0.23 * @edad - 5.4)
		end

		@grasa = @grasa.round(2)
		@grasa
	end

	def calcular_medias_circ
		@media = []
		aux = ((@circunferencias[0][0] + @circunferencias[0][1]) /2)
		aux = aux.round(2)
		@media.push(aux)
		aux = ((@circunferencias[1][0] + @circunferencias[1][1]) /2)
		aux = aux.round(2)
		@media.push(aux)
		aux = ((@circunferencias[2][0] + @circunferencias[2][1]) /2)
		aux = aux.round(2)
		@media.push(aux)
	
		@media	
	end
	
	def calcular_rcc
		calcular_medias_circ

		@rcc = (@media[1]/@media[2])
		@rcc = @rcc.round(2)
		@rcc		
	end

	def evaluar_imc
		calcular_imc

		if (@imc < 18.50)
			aux = "Bajo peso"
		elsif (@imc > 18.50 && @imc < 24.90)
			aux = "Adecuado"
		elsif (@imc > 25.00 && @imc < 29.90)
			aux = "Obesidad 1"
		elsif (@imc > 30.00 && @imc < 34.90)
			aux = "Obesidad 2"
		elsif (@imc > 35.00 && @imc < 39.90)
			aux = "Obesidad 3"
		end
		aux
	end

	def evaluar_rcc
		calcular_rcc

		if (@genero == "masculino")
			if (@rcc > 0.83 && @rcc < 0.88)
				aux = "Bajo"
			elsif (@rcc >= 0.88 && @rcc < 0.95)
				aux = "Moderado"
			elsif (@rcc >= 0.95 && @rcc < 1.01)
				aux = "Alto"
			elsif (@rcc >= 1.01)
				aux = "Muy alto"
			end
		elsif (@genero == "femenino")
			if (@rcc > 0.72 && @rcc < 0.75)
				aux = "Bajo"
			elsif (@rcc > 0.78 && @rcc < 0.82)
				aux = "Moderado"
			elsif (@rcc >= 0.82)
				aux = "Alto"
			end
		end
		aux	
	end

	def calcular_medias_plieg
		@media2 = []
		aux = ((@pliegues[0][0] + @pliegues[0][1] + @pliegues[0][2]) /3)
		aux = aux.round(2)
		@media2.push(aux)
		aux = ((@pliegues[1][0] + @pliegues[1][1] + @pliegues[1][2]) /3)
		aux = aux.round(2)
		@media2.push(aux)
		aux = ((@pliegues[2][0] + @pliegues[2][1] + @pliegues[2][2]) /3)
		aux = aux.round(2)
		@media2.push(aux)
		aux = ((@pliegues[3][0] + @pliegues[3][1] + @pliegues[3][2]) /3)
		aux = aux.round(2)
		@media2.push(aux)

        @media2
	end

end
