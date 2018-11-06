require "spec_helper"
require_relative "../lib/InfNut/infnutricional.rb"

RSpec.describe InfNut do

	#Codigo para la pruebas de TDD

  	it "Tiene un numero de version" do
    		expect(InfNut::VERSION).not_to be nil
  	end

	before :each do
		@info = InformacionNutricional.new("CocaCola", 1, 2, 3, 4, 5, 6, 7) 
	end

	#it "Tiene un constructor" do
		
	#end

end


