Given(/^there is a game with a player called "(.*?)" and field called "(.*?)"$/) do |name, field|
  visit "/new_game"
  fill_in(field, :with => name)
  click_button("submit")
end
