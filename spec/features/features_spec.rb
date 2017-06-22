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
      expect(page).to have_content "Enter your names"
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
      sign_in_and_play
    end

    it "displays player names" do
      expect(page).to have_content 'Verity'
    end

    it "displays Player 2's hit points" do
      expect(page).to have_content 'Verity\'s HP: 100'
    end

    it 'has a submit button' do
      expect { find_button('Attack') }.to_not raise_error
    end

    it 'gives an attack confirmation' do
        click_button('Attack')
        expect(page).to have_content 'Attack reduced player\'s HP by 10'
    end
  end

  describe "attack.erb" do
    it "should allow the player to continue" do
      sign_in_and_play
      click_button("Attack")
      expect { find_button('Continue') }.to_not raise_error
      end
    end

end
