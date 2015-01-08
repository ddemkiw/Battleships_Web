Feature: Setting up a game
	In order to play battleships
	As a nostalgic player
	I want to set up my ships

	Scenario: Set up Game
		Given I am on /setup_game
    	Then I should see "Welcome to the game" 

    Scenario: Greeting a player
    	Given I am on /new_game
	    When I fill in "player1" with "Jake" 
	    And I press "submit"
	    And I fill in "player2" with "Danielle"
	    And I press "submit"
	    And I follow "Start Your Game!"
        Then I should see "Welcome to the game!"

    Scenario: List Fleet 
        Given I am on /new_game
	    When I fill in "player1" with "Jake" 
	    And I press "submit"
	    And I fill in "player2" with "Danielle"
	    And I press "submit"
	    And I follow "Start Your Game!"
        Then I should see "Battleship, size: 4"

    Scenario: Place Ship
    	Given I am on /new_game
	    When I fill in "player1" with "Jake" 
	    And I press "submit"
	    And I fill in "player2" with "Danielle"
	    And I press "submit"
	    And I follow "Start Your Game!"
	    And I fill in "ship" with "Battleship"
	    And I fill in "coord" with "A1"
	    And I fill in "orientation" with "Vertical"
	    And I press "submit"
	    And I am on /setup_game
	    Then I should see "Ship placed"
