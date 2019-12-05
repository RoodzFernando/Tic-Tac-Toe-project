# frozen_string_literal: true

load File.expand_path('../bin/main', __dir__)
require File.expand_path('../lib/player', __dir__)
require File.expand_path('../lib/board', __dir__)

RSpec.describe do
  describe 'board_show' do
    it 'shows the board' do
      board_test = Board.new

      expect { board_show(board_test) }.to output(
        "+---+---+---+\n"\
        "| #{board_test.board_reader(0)} | #{board_test.board_reader(1)} | #{board_test.board_reader(2)} |\n"\
        "+---+---+---+\n"\
        "| #{board_test.board_reader(3)} | #{board_test.board_reader(4)} | #{board_test.board_reader(5)} |\n"\
        "+---+---+---+\n"\
        "| #{board_test.board_reader(6)} | #{board_test.board_reader(7)} | #{board_test.board_reader(8)} |\n"\
        "+---+---+---+\n"
      ).to_stdout
    end
  end

  describe 'player_name' do
    it "creates new players" do
      expect(Player).to receive(:new)
    end
  end

  describe 'determine_winner' do
    it 'Check for the possible end of the game' do
            player = Player.new("name")
            player.sign = /X || O/
      expect($winner == player.sign).to eq(false).and_return("It is a draw")
    end
  end

  describe Player do
    describe '#player_signs' do
      it "Check if the player sign is 'X' or 'O':" do
        player_sign = Player.new("")
        allow(player_sign).to receive(:player_signs).and_return(/X || O/)
      end
    end
  end
end

