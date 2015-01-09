Feature: Setting up a game
	In order to play battleships
	As a nostalgic player
	I want to set up my ships

	Scenario: Set up Game
		Given I have registered my name 
		And I am on /setup_game
    	Then I should see "Welcome to the game" 


    Scenario: Setup Ships
        Given I have registered my name 
        And I am on /setup_game
        Then I should see "Battleship"

    Scenario: Place Ship
    	Given I have registered my name 
	    And i fill in "coord" with "A1"
	    And I fill in "orientation" with "vertically"
	    And i fill in "ac_coord" with "A1"
	    And I fill in "ac_orientation" with "vertically"
	    And i fill in "d_coord" with "A1"
	    And I fill in "d_orientation" with "vertically"
	    And i fill in "s_coord" with "A1"
	    And I fill in "s_orientation" with "vertically"
	    And i fill in "p_coord" with "A1"
	    And I fill in "p_orientation" with "vertically"
	    And I press "submit"
	    And I am on /setup_game
	    Then I should see "Waiting for second player."