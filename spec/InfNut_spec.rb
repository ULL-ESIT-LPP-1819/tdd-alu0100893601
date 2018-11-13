require "spec_helper"
#require_relative "../lib/InfNut/infnutricional.rb"
require_relative "../lib/InfNut/list.rb"

RSpec.describe InfNut do

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

	#Continuacion en la practica

	it "Tiene un constructor la lista" do
		expect(@lista).to be_kind_of(List)
		expect(@lista.head).not_to be(nil)
		expect(@lista.tail).not_to be(nil)
		expect(@lista.actual).not_to be(nil)	
	end

	it "Tiene un constructor por parametro la lista" do
		etiqueta = InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 0.01, 2.0)
		nodo_aux = Struct::Nodo.new(etiqueta, nil, nil) 
		lista2 = List.new(nodo_aux)
		expect(lista2).to be_kind_of(List)
		expect(lista2.head).not_to be(nil)
		expect(lista2.tail).not_to be(nil)
		expect(lista2.actual).not_to be(nil)	
		lista2 = List.new(etiqueta)
		expect(lista2).to be_kind_of(List)
		expect(lista2.head).not_to be(nil)
		expect(lista2.tail).not_to be(nil)
		expect(lista2.actual).not_to be(nil)
	end

end
