class Player
    attr_reader :name
    attr_accessor :sign, :move
    def initialize(name)
        @name = name
    end
end