require './app.rb'

describe Battle, :type => :feature do

  describe "index.erb" do
    before do
      visit '/'
    end

    it "shows an expected string" do
      expect(page).to have_content 'Welcome to Battle'
    end

    it "Prompts the user to enter names" do
      expect(page).to have_content "Enter your Names"
    end

    describe "Player Name Form" do
      it "has a text field for player 1" do
        expect { find_field('player-1') }.to_not raise_error
      end

      it "has a text field for player 2" do
        expect { find_field('player-2') }.to_not raise_error
      end

      it 'has a submit button' do
        expect { find_button('Play') }.to_not raise_error
      end
    end
  end

  describe "play.erb" do
    before do
      visit '/'
    end

    it "displays player names" do
      fill_in 'player-1', with: 'Tom'
      fill_in 'player-2', with: 'Verity'
      click_button('Play')
      expect(page).to have_content 'Verity'
    end
  end


end
