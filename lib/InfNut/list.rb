require_relative "infnutricional.rb"

Struct.new("Nodo", :dato, :sig, :prev)

class List

	attr_accessor :head, :tail, :actual

	def initialize ()
		@head = Struct::Nodo.new(InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 0.01, 2.0), nil, nil)
		@tail = @head
		@actual = @head
	end

end