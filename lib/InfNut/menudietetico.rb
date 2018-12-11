require_relative "infnutricional.rb"
require_relative "valoracionnutricional.rb"

class MenuDietetico

	attr_reader :menu_comida, :val_individuo, :nivel_act, :pti, :geb, :et, :gaf, :get

	def initialize (valnut, lvl_act)
		@menu_comida = []
		@val_individuo = valnut
		@nivel_act = lvl_act
		@pti = 0.0
		@geb = 0.0
		@et = 0.0
		@gaf = 0.0
		@get = 0.0
	end

	def definir_menu
		@etiqueta1 = InformacionNutricional.new("CocaCola", 1.0, [180.0, 42.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta1)
		@etiqueta2 = InformacionNutricional.new("Salchichas enlatadas", 1.0, [755.0, 181.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta2)
		@etiqueta3 = InformacionNutricional.new("Millo", 1.0, [256.0, 61.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta3)
		@etiqueta4 = InformacionNutricional.new("Boloniesa", 1.0, [642.0, 154.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta4)
		@etiqueta5 = InformacionNutricional.new("Tomate frito", 1.0, [303.0, 73.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta5)
		@etiqueta6 = InformacionNutricional.new("Mayonesa", 1.0, [2311.0, 561.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta6)
		@etiqueta7 = InformacionNutricional.new("Pimientos", 1.0, [138.0, 33.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta7)
		@etiqueta8 = InformacionNutricional.new("Alubias", 1.0, [1563.0, 346.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta8)
		@etiqueta9 = InformacionNutricional.new("Garbanzos", 1.0, [1569.0, 370.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta9)
		@etiqueta10 = InformacionNutricional.new("Lentejas", 1.0, [1485.0, 360.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta10)
		@etiqueta11 = InformacionNutricional.new("Aceite", 1.0, [3378.0, 822.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta11)
		@etiqueta12 = InformacionNutricional.new("Sal", 1.0, [0.0, 0.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta12)
		@etiqueta13 = InformacionNutricional.new("Colacao", 1.0, [1593.0, 377.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta13)
		@etiqueta14 = InformacionNutricional.new("Nocilla", 1.0, [2298.0, 551.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta14)
		@etiqueta15 = InformacionNutricional.new("Cafe", 1.0, [1172.0, 278.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta15)
		@etiqueta16 = InformacionNutricional.new("Pan", 1.0, [1050.0, 244.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta16)
		@etiqueta17 = InformacionNutricional.new("Macarrones", 1.0, [1499.0, 354.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta17)
		@etiqueta18 = InformacionNutricional.new("Ramen", 1.0, [1919.0, 459.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta18)
		@etiqueta19 = InformacionNutricional.new("Pate", 1.0, [793.0, 191.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta19)
		@etiqueta20 = InformacionNutricional.new("Harina", 1.0, [1420.0, 346.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta20)
		@etiqueta21 = InformacionNutricional.new("Nata", 1.0, [674.0, 163.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta21)
		@etiqueta22 = InformacionNutricional.new("Chocolate", 1.0, [2004.0, 478.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta22)
		@etiqueta23 = InformacionNutricional.new("Limon", 1.0, [97.0, 23.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta23)
		@etiqueta24 = InformacionNutricional.new("Cereales", 1.0, [1630.0, 386.0], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
		@menu_comida.push(@etiqueta24)
	end

	def calcular_menu
		definir_menu
		calcular_gasto_energetico_total

		aux = @get
		vec_aux = @menu_comida
		menu_elegido = []
		
		fin = false
		srand 1
		while fin == false
			inx = rand(vec_aux.size)
			if ((aux - vec_aux[inx].valorenergetico[1]) >= 0.0)
				menu_elegido.push(vec_aux[inx])
				if (aux - vec_aux[inx].valorenergetico[1]) <= @get*0.1
					fin = true
				end
				aux = aux - vec_aux[inx].valorenergetico[1]
				vec_aux.delete_at(inx)
			else
				if (((aux - vec_aux[inx].valorenergetico[1]).abs) <= @get*0.1)
					menu_elegido.push(vec_aux[inx])
					aux = aux - vec_aux[inx].valorenergetico[1]
					vec_aux.delete_at(inx)	
					fin = true
				end
			end
		end
		menu_final = menu_elegido.collect {|x| "#{x.nombre}, #{x.valorenergetico[1]}"}
		menu_final
	end

	def calcular_peso_teorico_ideal 
		@pti= (@val_individuo.talla - 150.0) + 0.75 + 50.0
	end

	def calcular_gasto_energetico_basal
		if (@val_individuo.genero == "masculino")
			@geb = (10.0 * @val_individuo.peso) + (6.25 * @val_individuo.talla) - (5.0 + @val_individuo.edad) + 5.0
		elsif (@val_individuo.genero == "femenino") 
			@geb = (10.0 * @val_individuo.peso) + (6.25 * @val_individuo.talla) - (5.0 + @val_individuo.edad) - 161.0
		end							
	end

	def calcular_efecto_termogeno
		calcular_gasto_energetico_basal
		@et = @geb * 0.1 
	end

	def calcular_gasto_por_actividad_fisica
		calcular_gasto_energetico_basal
		if (@nivel_act == "Reposo")
			@gaf = @geb * 0.0
		elsif (@nivel_act == "Actividad ligera")
			@gaf = @geb * 0.12
		elsif (@nivel_act == "Actividad moderada")
			@gaf = @geb * 0.27
		elsif (@nivel_act == "Actividad intensa")
			@gaf = @geb * 0.54
		end
	end

	def calcular_gasto_energetico_total
		calcular_gasto_energetico_basal
		calcular_efecto_termogeno
		calcular_gasto_por_actividad_fisica
		@get = @geb + @et + @gaf		
	end

end