Feature: Starting new game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Starting Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "Player enter your name:"

  Scenario: Register Player 
    Given I am on /new_game
    When I fill in "player" with "Jake" 
    And I press "submit"
    Then I should see "Welcome to the game!"

  Scenario: Unable to Register Player 
    Given I am on /new_game
    And I fill in "player" with ""
    And I press "submit"
    Then I should see "Player enter your name:"
