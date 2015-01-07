Feature: Setting up a game
	In order to play battleships
	As a nostalgic player
	I want to set up my ships

	Scenario: Set up Game
		Given I am on /setup_game
    	Then I should see "Welcome to the game" 

    Scenario: Greeting a player
        Given there is a game with a player called "Jake" and field called "player1"
        Then I should see "Welcome to the game, Jake"
