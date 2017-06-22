require "./lib/game.rb"

describe Game do

  let(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe "#attack" do
    it "damages the other player" do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#player_1' do
     it 'identifies the first player' do
       expect(game.player_1).to eq(player_1)
     end
   end

   describe '#player_2' do
     it 'identifies the second player' do
       expect(game.player_2).to eq(player_2)
     end
   end

end
