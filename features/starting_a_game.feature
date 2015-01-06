Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Starting Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "Player 1, enter your name:"

  Scenario: Register Player 1
  	Given I am on new_game
  	When I fill in "player1" with "Jake" 
  	Then I should see "Player1 has been registered"

  Scenario: Unable to Register Player 1
  	Given I am on new_game
  	When I fill in "player1" with "^$"
  	Then I should see "Player1 is not valid. Please try again."

