require_relative "infnutricional.rb"

Struct.new("Nodo", :dato, :sig, :prev)

class List

	attr_accessor :head, :tail, :actual

	def initialize (nodito)
		if (nodito.nil?)
			etiq_aux = InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 0.01, 2.0)
			@head = Struct::Nodo.new(etiq_aux, nil, nil)
			@tail = @head
			@actual = @head
		elsif(nodito.is_a?Struct::Nodo)
			@head = nodito
			@tail = nodito
			@actual = nodito
		elsif (nodito.is_a?InformacionNutricional)
			@head = Struct::Nodo.new(nodito ,nil, nil)
			@tail = @head
			@actual = @head
		end
	end

	def insertarHead (nodito)
		if(nodito.is_a?Struct::Nodo)
			nodito.prev = nil
			nodito.sig = @head
			@head.prev = nodito
			@head = nodito
		end
	end

	def verHead
		@head
	end

end