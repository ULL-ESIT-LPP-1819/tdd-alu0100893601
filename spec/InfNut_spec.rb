RSpec.describe InfNut do

	#Codigo para la pruebas de TDD

  	it "Tiene un numero de version" do
    		expect(InfNut::VERSION).not_to be nil
  	end

	before :each do
		@info = InformacionNutricional.new() 
	end

	#it "Tiene un constructor" do
		
	#end

end


