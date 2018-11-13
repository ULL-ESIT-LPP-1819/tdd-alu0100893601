require_relative "infnutricional.rb"

Struct.new("Nodo", :dato, :sig, :ant)

class List

	attr_accessor :head, :tail, :actual, :size

	def initialize (nodito)
		if (nodito.nil?)
			etiq_aux = InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 0.01, 2.0)
			@head = Struct::Nodo.new(etiq_aux, nil, nil)
			@tail = @head
			@actual = @head
			@size = 1
		elsif(nodito.is_a?Struct::Nodo)
			@head = nodito
			@tail = nodito
			@actual = nodito
			@size = 1
		elsif (nodito.is_a?InformacionNutricional)
			@head = Struct::Nodo.new(nodito ,nil, nil)
			@tail = @head
			@actual = @head
			@size = 1
		end
	end

	def insertarHead (nodito)
		if(nodito.is_a?Struct::Nodo)
			nodito.ant = nil
			nodito.sig = @head
			@head.ant = nodito
			@head = nodito
			@size = @size + 1
		end
	end

	def borrarHead
		nodito = @head
		if(@size > 1)
			@head = nodito.sig
			@head.ant = Struct::Nodo.new(nil, nil, nil)
			@size = @size - 1
		elsif(@size==1)
			@head = Struct::Nodo.new(nil, nil, nil)
			@tail = @head
			@actual = @head
		else
			puts "Lista vacia"
		end
		nodito
	end

	def verHead
		@head
	end

	def insertarTail (nodito)
		if(nodito.is_a?Struct::Nodo)
			nodito.ant = nil
			nodito.sig = @tail
			@tail.ant = nodito
			@tail = nodito
			@size = @size + 1
		end
	end

	def borrarTail
		nodito = @tail
		if(@size > 1)
			@tail = nodito.sig
			@tail.ant = Struct::Nodo.new(nil, nil, nil)
			@size = @size - 1
		elsif(@size==1)
			@tail = Struct::Nodo.new(nil, nil, nil)
			@head = @tail
			@actual = @tail
		else
			puts "Lista vacia"
		end
		nodito
	end

	def verTail
		@tail
	end

	def to_s
		os = ""
		if(@size==1)
			os += @head.dato.nombre
		elsif (@size > 1)
			i = 0
			nodo_actual = @head
			while i < @size
				if (i == (@size-1))
					os += nodo_actual.dato.nombre + "."
				else
					os += nodo_actual.dato.nombre + ", "
				end
				nodo_actual = nodo_actual.sig
				i += 1
			end
		end
		os
	end

end