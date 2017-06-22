require './app.rb'

feature 'Attacking' do

  before do
    sign_in_and_play
    click_button("Attack")
    click_button("Continue")
  end
  scenario "should reduce player 2's HP by 10" do
    expect(page).not_to have_content 'Verity\'s HP: 100'
    expect(page).to have_content 'Verity\'s HP: 90'
  end

end
