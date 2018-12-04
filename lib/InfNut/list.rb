require_relative "infnutricional.rb"
require_relative "valoracionnutricional.rb"

Struct.new("Nodo", :dato, :sig, :ant)

class List

	include Enumerable

	attr_accessor :head, :tail, :actual, :size

	def initialize (nodito)
		if (nodito.nil?)
			etiq_aux = InformacionNutricional.new("Pinia en conserva", 0.5, [382.55, 90.16], 0.0, 12.0, 8.9, 0.5, 2.0, 0.01)
			@head = Struct::Nodo.new(etiq_aux, nil, nil)
			@tail = @head
			@actual = @head
			@size = 1
		elsif(nodito.is_a?Struct::Nodo)
			@head = nodito
			@tail = nodito
			@actual = nodito
			@size = 1
		elsif(nodito.is_a?InformacionNutricional)
			@head = Struct::Nodo.new(nodito ,nil, nil)
			@tail = @head
			@actual = @head
			@size = 1
		elsif(nodito.is_a?ValoracionNutricional)
			@head = Struct::Nodo.new(nodito ,nil, nil)
			@tail = @head
			@actual = @head
			@size = 1
		end
	end

	def each
        i = @head
        f = @size
        k = 0
        while (k < f) do
            yield i.dato
            i = i.sig
            k = k+1
        end
    end


	def insertarHead (nodito)
		if(nodito.is_a?Struct::Nodo)
			if (@size == 0)
				@head = nodito
				@size = @size + 1
				@tail = @head
			else
				nodito.ant = Struct::Nodo.new(nil, nil, nil)
				nodito.sig = @head
				@head.ant = nodito
				@head = nodito
				@size = @size + 1
			end
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
			if (@size == 0)
				@tail = nodito
				@size = @size + 1
				@head = @tail;
			else
				nodito.ant = Struct::Nodo.new(nil, nil, nil)
				nodito.sig = @tail
				@tail.ant = nodito
				@tail = nodito
				@size = @size + 1
			end
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

	def borrarDentro (inx)
		nodo_actual = @head
		fin = false
		while (i < @size)&&(!fin)
			if (i == inx)
				nodo_actual.prev.sig = nodo_actual.sig;
				nodo_actual.sig.prev = nodo_actual.prev;
				nodo_actual.ant = Struct::Nodo.new(nil, nil, nil)
				nodo_actual.sig = Struct::Nodo.new(nil, nil, nil)
				fin = true
			end
			if (!nodo_actual.sig.nil?)
				nodo_actual = nodo_actual.sig
			end
			i += 1
		end
		nodo_actual
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
					if (!nodo_actual.nil?)
						os += nodo_actual.dato.nombre + "."
					end
				else
					if (!nodo_actual.nil?)
						os += nodo_actual.dato.nombre + ", "
					end
				end
				if (!nodo_actual.sig.nil?)
					nodo_actual = nodo_actual.sig
				end
				i += 1
			end
		end
		os
	end

	def ordenarPorSal
		i = 0
		vector_aux = []
		vector_resultado = []
		nodo_actual = @head

		while i < @size
			vector_aux.push([nodo_actual.dato.nombre, nodo_actual.dato.sal])
			if (!nodo_actual.sig.nil?)	
				nodo_actual = nodo_actual.sig
			end
			i += 1
		end	

		cant_sal = 1000

		while vector_aux.length != 0
			cant_sal = 1000
			inx = 0
			i = 0
			while i < vector_aux.length
				if (cant_sal > vector_aux[i][1])
					inx = i
					cant_sal = vector_aux[i][1]
				end	
				i += 1
			end	

			vector_resultado.push(vector_aux[inx])
			vector_aux.delete_at(inx)

		end

		vector_resultado

	end

	def ordenarPorMasaPaciente
		i = 0
		vector_aux = []
		vector_resultado = []
		nodo_actual = @head

		while i < @size
			aux_imc = nodo_actual.dato.calcular_imc
			str_imc = nodo_actual.dato.evaluar_imc
			vector_aux.push([nodo_actual.dato.nombre, aux_imc, str_imc])
			if (!nodo_actual.sig.nil?)	
				nodo_actual = nodo_actual.sig
			end
			i += 1
		end	

		imc = 1000

		while vector_aux.length != 0
			imc = 1000
			inx = 0
			i = 0
			while i < vector_aux.length
				if (imc > vector_aux[i][1])
					inx = i
					imc = vector_aux[i][1]
				end	
				i += 1
			end	

			vector_resultado.push([vector_aux[inx][0], vector_aux[inx][2]])
			vector_aux.delete_at(inx)

		end
		vector_resultado

	end

end