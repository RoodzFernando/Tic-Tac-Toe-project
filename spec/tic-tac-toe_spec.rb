# require 'bin/main'
require './lib/player'

RSpec.describe do
    describe Player do 
        describe "#player_signs" do
            it "Check if the player sign is 'X' or 'O':" do
                allow($stdin).to receive(:gets).and_return('X' || 'O')
            end
        end
    end
end

