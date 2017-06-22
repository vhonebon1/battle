require 'player.rb'

describe Player do
  let(:alice) { Player.new("Alice", 90) }
  let(:elle) { Player.new("Elle") }

  it "should return its name" do
    expect(alice.name).to eq 'Alice'
  end

  it "should return play's HP at the start of the game" do
    expect(alice.hit_points).to eq(90)
  end

  it "should have a default hit point number" do
    expect(elle.hit_points).to eq(100)
  end

  describe "#receive_damage" do
    it "reduced player's HP points" do
      expect { alice.receive_damage }.to change { alice.hit_points }.by(-10)
    end
  end

end
