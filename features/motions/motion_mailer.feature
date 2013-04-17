Feature: Test Mailers
  Scenario: Motion mailer works
    Given there is a group and a discussion
    When I create a motion
    Then group users should recieve an email

  Scenario: Dumb ass mailer
    When I send a dumb ass mailer
    Then a dumb ass email should be sent
