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
    	And I am on /setup_game
	    And I fill in "coord" with "A1"
	    And I select "vertically" from "orientation"
	    And I fill in "ac_coord" with "A2"
	    And I select "vertically" from "ac_orientation"
	    And I fill in "d_coord" with "A3"
	    And I select "vertically" from "d_orientation"
	    And I fill in "s_coord" with "A4"
	    And I select "vertically" from "s_orientation"
	    And I fill in "p_coord" with "A5"
	    And I select "vertically" from "p_orientation"
	    And I press "submit"
	    Then I should see "Game ready."