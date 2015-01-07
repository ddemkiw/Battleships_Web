Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Starting Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "Player 1, enter your name:"

  Scenario: Register Player 1
  	Given I am on /new_game
  	When I fill in "player1" with "Jake" 
    And I press "submit"
  	Then I should see "Player1 has been registered"

  Scenario: Unable to Register Player 1
  	Given I am on /new_game
  	When I fill in "player1" with ""
    And I press "submit"
  	Then I should see "Player 1, enter your name:"

  Scenario: Register Player 2
    Given I am on /new_game
    When I fill in "player1" with "Jake" 
    And I press "submit"
    And I fill in "player2" with "Danielle"
    And I press "submit"
    Then I should see "Start Your Game!"

  Scenario: Unable to Register Player 2
    Given I am on /new_game
    When I fill in "player1" with "Jake" 
    And I press "submit"
    And I fill in "player2" with ""
    And I press "submit"
    Then I should see "Input player 2's name:"

  Scenario: Once complete, go to start your game
    Given I am on /new_game
    When I fill in "player1" with "Jake" 
    And I press "submit"
    And I fill in "player2" with "Danielle"
    And I press "submit"
    And I follow "Start Your Game!"
    Then I should see "HERP DERP"



