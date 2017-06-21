require './app.rb'

describe Battle, :type => :feature do
  it "shows an expected string" do
  visit '/'
  expect(page).to have_content 'Testing infrastructure working!'
end
end
