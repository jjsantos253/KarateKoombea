Feature: Validate that the character endpoint is retorning the right response body and status

  Background:
    * url 'https://rickandmortyapi.com/api'

  Scenario: Validate the response code from the character endpoint
    Given path 'character'
    When method get
    Then status 200

  Scenario: Validate the content type from the character endpoint
    Given path 'character'
    When method get
    Then status 200
    Then match header Content-Type == 'application/json; charset=utf-8'

  Scenario: Validate the response body getting all the characters
    * def expectedResult = read ('characterResponse.json')
    Given path 'character'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate the response body getting a single the character
    * def expectedResult = read ('characterResponseSingle.json')
    Given path 'character/2'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate the response body getting multiple characters
    * def expectedResult = read ('characterResponseMultiple.json')
    Given path 'character/2,1'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate the response body through a query
    * def expectedResult = read ('characterResponseQuery.json')
    Given path 'character/?name=rick&status=dead'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate that the page not found response is being handle on the character endpoint
    Given path 'character/900'
    When method get
    Then status 404

