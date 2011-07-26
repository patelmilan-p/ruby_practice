Feature: Player starts the game

  As a player
  I start the game
  So that i can play "Craps"

  Scenario: Player starts the game
    Given I am not yet playing the game
    When  I start the game
    Then  I should see "Welcome to Craps."
    And   I should see "Do you want to roll the dice?"
