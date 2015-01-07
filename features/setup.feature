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
        Then I should see "Welcome to the game, Jake"
