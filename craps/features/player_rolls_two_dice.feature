Feature: Player rolls two dice


  After the first throw, if the sum of the numbers on the upward faces of the dice is 7 or 11 then the player wins.
  Or if the sum is 2, 3 or 12 then the player loses (called "craps").
  Or if the sum is 4, 5, 6, 8, 9 or 10 then sum becomes the player's 'point'
  To win you must continue rolling the dice until you "make your point" or you lose if you roll 7 before making a point.

  Scenario: Player wants to roll the dice
    Given I start the game
    When I want to roll the dice
    Then I should see the result of the rolled dice


