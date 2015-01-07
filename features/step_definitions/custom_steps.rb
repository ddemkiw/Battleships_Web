Given(/^there is a game with a player called "(.*?)"/) do |name|
  visit "/new_game"
  fill_in("player1", :with => name)
  click_button("submit")
end
