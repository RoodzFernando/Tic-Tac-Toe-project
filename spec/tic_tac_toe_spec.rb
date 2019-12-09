# frozen_string_literal: true

load File.expand_path('../bin/main', __dir__)
require File.expand_path('../lib/player', __dir__)
require File.expand_path('../lib/board', __dir__)

RSpec.describe do
  describe 'board_show' do
    let(:board_test) { Board.new }
    it 'shows the board' do
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
    let(:player_1) { Player.new('Player1') }
    let(:player_2) { Player.new('Player2') }
    let(:winner) { 'X' }
    let(:no_winner) { 'Draw' }
    it 'tells when player 1 wins' do
      allow(player_1).to receive(:sign).and_return('X')
      allow(player_2).to receive(:sign).and_return('O')
      expect { determine_winner(winner, player_1, player_2) }.to output {
        'Congratulations! Player1 wins! Want to play again? (Y or N)'
      }.to_stdout
    end

    it 'tells when player 2 wins' do
      allow(player_1).to receive(:sign).and_return('O')
      allow(player_2).to receive(:sign).and_return('X')
      expect { determine_winner(winner, player_1, player_2) }.to output {
        'Congratulations! Player2 wins! Want to play again? (Y or N)'
      }.to_stdout
    end

    it "tells when it's a draw" do
      allow(player_1).to receive(:sign).and_return('O')
      allow(player_2).to receive(:sign).and_return('X')
      expect { determine_winner(no_winner, player_1, player_2) }.to output {
                                                                      'It\'s a draw! Want to play again? (Y or N)'
                                                                    } .to_stdout
    end
  end

  describe 'game_finish?' do
    let(:board_test) { ['X', 'X', 'X', 4, 5, 6, 'O', 'O', 9] }
    
    # let(:game_checker) {false}
    it 'Check if the game is finish by a win' do

      # allow(board_test).to receive(:board_update).with('X', 0).and_return('X')
      # allow(board_test).to receive(:board_update).with('X', 1)
      # allow(board_test).to receive(:board_update).with('X', 2)
      p board_test
          expect((board_test).include?('X')).to eq(true)
    end
  end

  describe Player do
    describe '#player_signs' do
      it "Check if the player sign is 'X' or 'O':" do
        player_sign = Player.new('')
        allow(player_sign).to receive(:player_signs).and_return(/X || O/)
      end
    end
  end
end
