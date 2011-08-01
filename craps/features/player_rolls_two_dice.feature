Feature: Player rolls two dice


  After the first throw, if the sum of the numbers on the upward faces of the dice is 7 or 11 then the player wins.
  Or if the sum is 2, 3 or 12 then the player loses (called "craps").
  Or if the sum is 4, 5, 6, 8, 9 or 10 then sum becomes the player's 'point'
  To win you must continue rolling the dice until you "make your point" or you lose if you roll 7 before making a point.

  Scenario: Player accepts to roll the dice
    Given I start the game
    When I want to roll the dice
    Then I should see the result of the rolled dice

  Scenario Outline: Player rolled the dice for the first time
    Given I accept to roll the dice
    When Dice's are rolled as "<dice1>" and "<dice2>"
    Then I should see the "<result>" and "<game_status>"

    Scenarios: Result of the rolled dice
      | dice1 | dice2 | result | game_status       |
      | 2     | 3     |   5    | your point is 5   |
      | 4     | 5     |   9    | your point is 9   |
      | 5     | 1     |   6    | your point is 6   |
      | 6     | 6     |   12   | you lost the game |
      | 4     | 4     |   8    | your point is 8   |
      | 5     | 6     |   11   | you won the game  |

  Scenario Outline: Player rolls the dice next time and wins
    Given I accept to roll the dice
    When Dice's are rolled as "<dice1>" and "<dice2>"
    And  The result is equal to the "<point>"
    Then I should see "you won the game"

    Scenarios: Result of the rolled dice
      | dice1 | dice2 | point |
      | 2     | 3     |   5   |
      | 3     | 3     |   6   |

  Scenario Outline: Player rolls the dice next time and loses
    Given I accept to roll the dice
    When Dice's are rolled as "<dice1>" and "<dice2>"
    And  The result is equal to 7
    Then I should see "you lost the game"

    Scenarios: Result of the rolled dice
      | dice1 | dice2 |
      | 4     | 3     |
      | 2     | 5     |

  Scenario Outline: Player rolls the dice next time and continues
    Given I accept to roll the dice
    When  Dice's are rolled as "<dice1>" and "<dice2>"
    And   The result is not equal to the "<point>"
    Then  I should see "do you want to continue rolling the dice?"

    Scenarios: Result of the rolled dice
      | dice1 | dice2 | point |
      | 2     | 4     |   7   |
      | 5     | 5     |   12  |
