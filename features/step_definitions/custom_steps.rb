Given(/^I have registered my name$/) do
  visit path_to("/new_game")
  fill_in("player", :with => "Jake")
  click_button("submit")
end