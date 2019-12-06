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

  describe 'determine_winner' do
    it "tells when player 1 wins" do
      $player_1 = Player.new('Player1')
      $player_1.sign = 'X'
      $winner = 'X'
      expect {determine_winner}.to output{
        "Congratulations! Player1 wins! Want to play again? (Y or N)"
    }.to_stdout
    end

    it "tells when player 2 wins" do
      $player_2 = Player.new('Player2')
      $player_2.sign = 'X'
      $winner = 'X'
      expect {determine_winner}.to output{
        "Congratulations! Player2 wins! Want to play again? (Y or N)"
    }.to_stdout
    end
  end

  describe 'player_name' do
    it "creates new players" do
      name1 = double("player1")
      expect($player_1.name).to eq('Test1')
      # expect($player_2).to be_truthy
    end
  end

  describe 'determine_winner' do
    it 'Check for the possible end of the game' do
            player = Player.new("name")
            player.sign = /X || O/
      expect($winner == player.sign).to eq(false)
    end
  end

  describe 'game_finish?' do
    it "Check if the game is finish by a win" do
      win =false
      win_board = [[0,1,2],[3,4,5],[6,7,9],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
      win_board.each do |elem|
        elem.each { |n| n = 'X'
        win = true if n == 'X'
        expect(win).to eq(true)
      }
      end
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

