require "spec_helper"
require_relative "../lib/InfNut/infnutricional.rb"

RSpec.describe InfNut do

	#Codigo para la pruebas de TDD

  	it "Tiene un numero de version" do
    		expect(InfNut::VERSION).not_to be nil
  	end

	before :each do
		@info = InformacionNutricional.new("CocaCola", 3.3, [180, 42], 0, 0, 10.6, 10.6, 0, 0) 
	end

	it "Tiene un constructor" do
		expect(@info.nombre).to eq("CocaCola")
		expect(@info.porciones).to eq(3.3)
		expect(@info.valorenergetico[0]).to eq(180)
		expect(@info.valorenergetico[1]).to eq(42)
		expect(@info.grasa).to eq(0)
		expect(@info.grasasaturada).to eq(0)
		expect(@info.hidratos).to eq(10.6)
		expect(@info.azucar).to eq(10.6)
		expect(@info.proteinas).to eq(0)
		expect(@info.sal).to eq(0)					
	end

	it "Calculo de valor energetico" do
		expect(@info.calculokJ).to eq(594)
		expect(@info.calculokCal).to eq(138.6)
	end

	it "Calculo de grasas" do
		expect(@info.calculoGrasa).to eq(0)
		expect(@info.calculoGrasaSaturada).to eq(0)
	end

	it "Calculo de hidratos de los cuales azucares" do
		expect(@info.calculoHidratos).to eq(34.98)
		expect(@info.calculoAzucar).to eq(34.98)
	end

	it "Calcuo de las proteinas" do
		expect(@info.calculoProteinas).to eq(0)
	end

	it "Calculo de sal" do
		expect(@info.calculoSal).to eq(0)
	end	

end


