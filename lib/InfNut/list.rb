require_relative "infnutricional.rb"

Struct.new("Nodo", :dato, :sig, :prev)

class List

	attr_accessor :head, :tail, :actual

end