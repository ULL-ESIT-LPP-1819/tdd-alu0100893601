require "spec_helper"
require_relative "../lib/InfNut/menudietetico.rb"
require_relative "../lib/InfNut/list.rb"
require_relative "../lib/InfNut/paciente.rb"

RSpec.describe "Etiquetas de información nutricional" do

	#Codigo para la pruebas de TDD

  	it "Tiene un numero de version" do
    		expect(InfNut::VERSION).not_to be nil
  	end

	before :each do
		@cocacola = InformacionNutricional.new("CocaCola", 3.3, [180, 42], 0, 0, 10.6, 10.6, 0, 0) 
		@lista = List.new(nil)
	end

	it "Tiene un constructor" do
		expect(@cocacola.nombre).to eq("CocaCola")
		expect(@cocacola.porciones).to eq(3.3)
		expect(@cocacola.valorenergetico[0]).to eq(180)
		expect(@cocacola.valorenergetico[1]).to eq(42)
		expect(@cocacola.grasa).to eq(0)
		expect(@cocacola.grasasaturada).to eq(0)
		expect(@cocacola.hidratos).to eq(10.6)
		expect(@cocacola.azucar).to eq(10.6)
		expect(@cocacola.proteinas).to eq(0)
		expect(@cocacola.sal).to eq(0)					
	end

	it "Calculo de valor energetico" do
		expect(@cocacola.calculokJ).to eq(594)
		expect(@cocacola.calculokCal).to eq(138.6)
	end

	it "Calculo de grasas" do
		expect(@cocacola.calculoGrasa).to eq(0)
		expect(@cocacola.calculoGrasaSaturada).to eq(0)
	end

	it "Calculo de hidratos de los cuales azucares" do
		expect(@cocacola.calculoHidratos).to eq(34.98)
		expect(@cocacola.calculoAzucar).to eq(34.98)
	end

	it "Calcuo de las proteinas" do
		expect(@cocacola.calculoProteinas).to eq(0)
	end

	it "Calculo de sal" do
		expect(@cocacola.calculoSal).to eq(0)
	end	

	it "Calculo de proporciones" do
		expect(@cocacola.calculoIR).to eq([[7.07, 6.93], 0, 0, 13.45, 38.87, 0, 0])
	end

	it "Mostrar proporciones" do
		expect(@cocacola.to_s).to eq("[[7.07, 6.93], 0.0, 0.0, 13.45, 38.87, 0.0, 0.0]")
	end

end

RSpec.describe "Pruebas de la lista" do

	#Continuacion en la practica

	before :each do
		@lista = List.new(nil)
	end

	it "Tiene un constructor la lista" do
		expect(@lista).to be_kind_of(List)
		expect(@lista.head).not_to be(nil)
		expect(@lista.tail).not_to be(nil)
		expect(@lista.actual).not_to be(nil)
		expect(@lista.size).not_to be(nil)	
	end

	it "Tiene un constructor por parametro la lista" do		
		etiqueta = InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 0.01, 2.0)
		nodo_aux = Struct::Nodo.new(etiqueta, nil, nil) 

		lista2 = List.new(nodo_aux)
		expect(lista2).to be_kind_of(List)
		expect(lista2.head).not_to be(nil)
		expect(lista2.tail).not_to be(nil)
		expect(lista2.actual).not_to be(nil)
		expect(lista2.size).not_to be(nil)

		lista2 = List.new(etiqueta)
		expect(lista2).to be_kind_of(List)
		expect(lista2.head).not_to be(nil)
		expect(lista2.tail).not_to be(nil)
		expect(lista2.actual).not_to be(nil)
		expect(lista2.size).not_to be(nil)
	end

	#it "La lista esta vacia" do
	#	expect(@lista.verHead).to eq(nil)
	#	expect(@lista.verTail).to eq(nil)
	#end

	it "La clase List puede insertar por el principio" do
		etiqueta = InformacionNutricional.new("CocaCola", 3.3, [180.0, 42.0], 0.0, 0.0, 10.6, 10.6, 0.0, 0.0)
		nodo_aux = Struct::Nodo.new(etiqueta, nil, nil)

		@lista.insertarHead(nodo_aux)
		expect(@lista.verHead).to eq(nodo_aux)
		expect(@lista.size).not_to be(0)
	end

	it "La clase List puede borrar por el principio" do
		nodo_aux = @lista.verHead;

		expect(@lista.borrarHead).to eq(nodo_aux)
	end

	it "La clase List puede insertar por el final" do
		etiqueta = InformacionNutricional.new("CocaCola", 3.3, [180.0, 42.0], 0.0, 0.0, 10.6, 10.6, 0.0, 0.0)
		nodo_aux = Struct::Nodo.new(etiqueta, nil, nil)

		@lista.insertarTail(nodo_aux)
		expect(@lista.verTail).to eq(nodo_aux)
		expect(@lista.size).not_to be(0)
	end

	it "La clase List puede borrar por el final" do
		nodo_aux = @lista.verTail;

		expect(@lista.borrarTail).to eq(nodo_aux)
	end

	it "La clase List tiene un metodo para formatear la salida" do	

		etiqueta1 = InformacionNutricional.new("CocaCola", 3.3, [180.0, 42.0], 0.0, 0.0, 10.6, 10.6, 0.0, 0.0)
		etiqueta2 = InformacionNutricional.new("Salchichas enlatadas", 1.25, [755.0, 181.0], 13.0, 4.9, 7.1, 0.5, 9.0, 2.2)
		etiqueta3 = InformacionNutricional.new("Millo", 1.25, [755.0, ], 13.0, 4.9, 7.1, 0.5, 9.0, 2.2)
		etiqueta4 = InformacionNutricional.new("Boloniesa", 3.0, [642.0, 154.0], 10.0, 1.9, 11.4, 9.6, 3.8, 1.4)

		nodo_aux = Struct::Nodo.new(etiqueta1, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta2, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta3, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta4, nil, nil)
		@lista.insertarHead(nodo_aux)

		expect(@lista.to_s).to eq("Boloniesa, Millo, Salchichas enlatadas, CocaCola, Pinia en conserva.")
	end

	it "La clase List es capaz de ordenar por cantidad de SAL" do

		etiqueta1 = InformacionNutricional.new("CocaCola", 3.3, [180.0, 42.0], 0.0, 0.0, 10.6, 10.6, 0.0, 0.0)
		etiqueta2 = InformacionNutricional.new("Salchichas enlatadas", 1.25, [755.0, 181.0], 13.0, 4.9, 7.1, 0.5, 9.0, 2.2)
		etiqueta3 = InformacionNutricional.new("Millo", 1.25, [755.0, ], 13.0, 4.9, 7.1, 0.5, 9.0, 2.2)
		etiqueta4 = InformacionNutricional.new("Boloniesa", 3.0, [642.0, 154.0], 10.0, 1.9, 11.4, 9.6, 3.8, 1.4)

		nodo_aux = Struct::Nodo.new(etiqueta1, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta2, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta3, nil, nil)
		@lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(etiqueta4, nil, nil)
		@lista.insertarHead(nodo_aux)

		puts @lista.ordenarPorSal.to_s
		expect(@lista.ordenarPorSal.to_s).to eq("[[\"CocaCola\", 0.0], [\"Pinia en conserva\", 0.01], [\"Boloniesa\", 1.4], [\"Millo\", 2.2], [\"Salchichas enlatadas\", 2.2]]")

	end

end

RSpec.describe "Pruebas para la parte de herencia" do

	before :each do

		@valNut = ValoracionNutricional.new("ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])

		@paciente1 = Paciente.new(55555555, "11111111111", "ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])
		@paciente2 = Paciente.new(66666666, "22222222222", "PedroLuis", 35, "masculino", 65, 1.70, [[37.5, 37.1], [87.3, 88.6], [96.5, 96.6]], [[23, 25, 23], [12, 14, 13], [9, 10, 9], [39, 38, 37]])
		@paciente3 = Paciente.new(77777777, "33333333333", "RaulHdez", 40, "masculino", 70, 1.72, [[39.5, 39.1], [89.3, 90.6], [98.5, 98.6]], [[25, 27, 25], [14, 16, 15], [11, 12, 11], [41, 40, 39]])
		@paciente4 = Paciente.new(88888888, "44444444444", "LuisLuis", 45, "masculino", 75, 1.74, [[41.5, 41.1], [91.3, 92.6], [100.5, 100.6]], [[27, 29, 27], [16, 18, 17], [13, 14, 13], [43, 42, 41]])
		@paciente5 = Paciente.new(99999999, "00000000000", "AdolfoGarcia", 50, "masculino", 80, 1.76, [[42.5, 43.1], [93.3, 94.6], [102.5, 102.6]], [[29, 31, 29], [18, 20, 19], [15, 16, 15], [45, 44, 43]])

		@paraConsulta = Consulta.new(true, 55555555, "11111111111", "ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])
		@tratarObesidad = TratarObesidad.new(false, 55555555, "11111111111", "ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])
	end

	it "La clase PACIENTE tiene constructor" do
		expect(@paciente1.identificacion).not_to be(nil)
		expect(@paciente1.nsegsocial).not_to be(nil)
	end

	it "Paciente en consulta" do
		expect(@paraConsulta.cita).to be(true)
	end

	it "Paciente para tratar obesidad" do
		expect(@tratarObesidad.calcularTratoDeObesidad).to eq(false)
	end

	it "Comprobacion de clases" do
		#puts @paraConsulta.class
		#puts @paciente1.class
		#puts @valNut.class
		#puts Object.class
		#puts BasicObject.class
		expect(@paraConsulta.class).to be(Consulta)
		expect(@paciente1.class).to be(Paciente)
		expect(@valNut.class).to be(ValoracionNutricional)
		expect(Object.class).to be(Class)
		expect(BasicObject.class).to be(Class)
	end

	it "Comprobacion tipos" do
		expect(@valNut).to respond_to("calcular_imc")
		expect(@tratarObesidad).to respond_to("calcularTratoDeObesidad")
	end

	it "Comprobacion de las superclases" do
		#puts @paraConsulta.superclass
		#puts Paciente.superclass
		#puts Paciente.superclass.superclass
		#puts Paciente.superclass.superclass.superclass
		expect(Consulta.superclass).to be(Paciente)
		expect(Paciente.superclass).to be(ValoracionNutricional)
		expect(Paciente.superclass.superclass).to be(Object)
		expect(Paciente.superclass.superclass.superclass).to be(BasicObject)
	end

	it "Comprobación de la jerarquia" do
		expect(@paraConsulta).to be_kind_of(Consulta)
		expect(@paraConsulta).to be_kind_of(Paciente)
		expect(@paraConsulta).to be_kind_of(ValoracionNutricional)
		expect(@paraConsulta).to be_kind_of(Object)
		expect(@paraConsulta).to be_kind_of(BasicObject)

		#puts @paciente1.is_a?Paciente
		#puts @paciente1.is_a?ValoracionNutricional
		#puts @paciente1.is_a?Object
		#puts @paciente1.is_a?BasicObject
		expect(@paciente1).to be_kind_of(Paciente)
		expect(@paciente1).to be_kind_of(ValoracionNutricional)
		expect(@paciente1).to be_kind_of(Object)
		expect(@paciente1).to be_kind_of(BasicObject)
	end

	it "Evaluacion de la masa corporal" do
		nodo_aux = Struct::Nodo.new(@paciente1, nil, nil)
		@listaMasa = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@paciente2, nil, nil)
		@listaMasa.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@paciente3, nil, nil)
		@listaMasa.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@paciente4, nil, nil)
		@listaMasa.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@paciente5, nil, nil)
		@listaMasa.insertarHead(nodo_aux)

		puts @listaMasa.ordenarPorMasaPaciente.to_s
		expect(@listaMasa.ordenarPorMasaPaciente.to_s).to eq("[[\"ManoloGlez\", \"Adecuado\"], [\"PedroLuis\", \"Adecuado\"], [\"RaulHdez\", \"Adecuado\"], [\"LuisLuis\", \"Adecuado\"], [\"AdolfoGarcia\", \"Obesidad 1\"]]")

	end

end

RSpec.describe "Pruebas de los modulos" do

	before :each do
		@etiqueta1 = InformacionNutricional.new("CocaCola", 3.3, [180.0, 42.0], 0.0, 0.0, 10.6, 10.6, 0.0, 0.0)
		@etiqueta2 = InformacionNutricional.new("Salchichas enlatadas", 1.25, [755.0, 181.0], 13.0, 4.9, 7.1, 0.5, 9.0, 2.2)
		@etiqueta3 = InformacionNutricional.new("Millo", 1.3, [256.0, 61.0], 0.1, 22.0, 2.6, 3.0, 0.53, 1.0)
		@etiqueta4 = InformacionNutricional.new("Boloniesa", 3.0, [642.0, 154.0], 10.0, 1.9, 11.4, 9.6, 3.8, 1.4)
		@val1 = ValoracionNutricional.new("ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])
		@val2 = ValoracionNutricional.new("PedroLuis", 35, "masculino", 65, 1.70, [[37.5, 37.1], [87.3, 88.6], [96.5, 96.6]], [[23, 25, 23], [12, 14, 13], [9, 10, 9], [39, 38, 37]])
		@val3 = ValoracionNutricional.new("RaulHdez", 40, "masculino", 70, 1.72, [[39.5, 39.1], [89.3, 90.6], [98.5, 98.6]], [[25, 27, 25], [14, 16, 15], [11, 12, 11], [41, 40, 39]])
	end

	it "Uso del modulo Comparable en etiquetas de inf. nutricional" do
		expect(@etiqueta3<@etiqueta4).to be(true)
		expect(@etiqueta3<=@etiqueta4).to be(true)
		expect(@etiqueta3==@etiqueta4).to be(false)
		expect(@etiqueta4==@etiqueta4).to be(true)
		expect(@etiqueta3>@etiqueta4).to be(false)
		expect(@etiqueta3>=@etiqueta4).to be(false)
		expect(@etiqueta2.between?(@etiqueta3, @etiqueta4)).to be(true)
	end

	it "Uso del modulo Comparable en valoracion nutricional" do
		expect(@val1<@val2).to be(true)
		expect(@val1<=@val2).to be(true)
		expect(@val2==@val2).to be(true)
		expect(@val2==@val3).to be(false)
		expect(@val3>@val1).to be(true)
		expect(@val3>=@val2).to be(true)
		expect(@val2.between?(@val1, @val3)).to be(true)
	end

	it "Uso del modulo enumerable para lista de etiquetas 1" do
		nodo_aux = Struct::Nodo.new(@etiqueta1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta3, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta4, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.collect {|x| x.nombre}).to eq(["Boloniesa", "Millo", "Salchichas enlatadas", "CocaCola"])
	end

	it "Uso del modulo enumerable para lista de etiquetas 2" do
		nodo_aux = Struct::Nodo.new(@etiqueta1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta3, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta4, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.select {|x| x.nombre == "Millo"}).to eq([@etiqueta3])
	end

	it "Uso del modulo enumerable para lista de etiquetas 3" do
		nodo_aux = Struct::Nodo.new(@etiqueta1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta3, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta4, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.max).to eq(@etiqueta4)
		expect(lista.min).to eq(@etiqueta3)
	end

	it "Uso del modulo enumerable para lista de etiquetas 4" do
		nodo_aux = Struct::Nodo.new(@etiqueta1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta3, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@etiqueta4, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.sort).to eq([@etiqueta3, @etiqueta1, @etiqueta2, @etiqueta4])
	end

		it "Uso del modulo enumerable para lista de valoraciones 1" do
		nodo_aux = Struct::Nodo.new(@val1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val3, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.collect {|x| x.nombre}).to eq(["RaulHdez", "PedroLuis", "ManoloGlez"])
	end

	it "Uso del modulo enumerable para lista de valoraciones 2" do
		nodo_aux = Struct::Nodo.new(@val1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val3, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.select {|x| x.nombre == "PedroLuis"}).to eq([@val2])
	end

	it "Uso del modulo enumerable para lista de valoraciones 3" do
		nodo_aux = Struct::Nodo.new(@val1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val3, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.max).to eq(@val3)
		expect(lista.min).to eq(@val1)
	end

	it "Uso del modulo enumerable para lista de valoraciones 4" do
		nodo_aux = Struct::Nodo.new(@val1, nil, nil)
		lista = List.new(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val2, nil, nil)
		lista.insertarHead(nodo_aux)
		nodo_aux = Struct::Nodo.new(@val3, nil, nil)
		lista.insertarHead(nodo_aux)

		expect(lista.sort).to eq([@val1, @val2, @val3])
	end

end

RSpec.describe "Pruebas de la practica 10" do

	before :each do
		@val1 = ValoracionNutricional.new("ManoloGlez", 30, "masculino", 60, 1.68, [[35.5, 35.1], [85.3, 86.6], [94.5, 94.6]], [[21, 22, 21], [10, 12, 11], [7, 8, 7], [37, 36, 35]])
		@val2 = ValoracionNutricional.new("PedroLuis", 35, "masculino", 65, 1.70, [[37.5, 37.1], [87.3, 88.6], [96.5, 96.6]], [[23, 25, 23], [12, 14, 13], [9, 10, 9], [39, 38, 37]])
		@val3 = ValoracionNutricional.new("RaulHdez", 40, "masculino", 70, 1.72, [[39.5, 39.1], [89.3, 90.6], [98.5, 98.6]], [[25, 27, 25], [14, 16, 15], [11, 12, 11], [41, 40, 39]])
		@val4 = ValoracionNutricional.new("JonNieve", 45, "masculino", 75, 1.74, [[42.5, 42.1], [92.3, 93.6], [101.5, 101.6]], [[27, 29, 27], [16, 18, 17], [13, 14, 13], [43, 42, 41]])
		@val5 = ValoracionNutricional.new("OptimusPrime", 50, "femenino", 80, 1.76, [[45.5, 45.1], [95.3, 96.6], [104.5, 104.6]], [[29, 32, 29], [17, 20, 19], [15, 17, 15], [45, 45, 44]])
	end

	it "Prueba del menu" do

		puts "---------------------------------------------"
		menusito = MenuDietetico.new(@val1, "Reposo")
		result = menusito.calcular_menu
		puts "Gasto a satisfacer: #{menusito.get.round}"
		puts result
		expect(result).to eq(["Mayonesa, 561.0", "Pimientos, 33.0"])

		puts "---------------------------------------------"
		menusito = MenuDietetico.new(@val2, "Actividad ligera")
		result = menusito.calcular_menu
		puts "Gasto a satisfacer: #{menusito.get.round}"
		puts result
		expect(result).to eq(["Mayonesa, 561.0", "Pimientos, 33.0", "CocaCola, 42.0", "Millo, 61.0"])

		puts "---------------------------------------------"
		menusito = MenuDietetico.new(@val3, "Actividad moderada")
		result = menusito.calcular_menu
		puts "Gasto a satisfacer: #{menusito.get.round}"
		puts result
		expect(result).to eq(["Mayonesa, 561.0", "Colacao, 377.0"])

		puts "---------------------------------------------"
		menusito = MenuDietetico.new(@val4, "Actividad intentsa")
		result = menusito.calcular_menu
		puts "Gasto a satisfacer: #{menusito.get.round}"
		puts result
		expect(result).to eq(["Mayonesa, 561.0", "Pimientos, 33.0", "CocaCola, 42.0", "Millo, 61.0", "Sal, 0.0", "Limon, 23.0"])

		puts "---------------------------------------------"
		menusito = MenuDietetico.new(@val5, "Reposo")
		result = menusito.calcular_menu
		puts "Gasto a satisfacer: #{menusito.get.round}"
		puts result
		expect(result).to eq(["Mayonesa, 561.0", "Pimientos, 33.0"])
		puts "---------------------------------------------"

	end

end