Feature: Validate that the location endpoint is retorning the right response body and status

  Background:
    * url 'https://rickandmortyapi.com/api'

  Scenario: Validate the response code from the location endpoint
    Given path 'location'
    When method get
    Then status 200

  Scenario: Validate the content type from the location endpoint
    Given path 'location'
    When method get
    Then status 200
    Then match header Content-Type == 'application/json; charset=utf-8'

  Scenario: Validate the response content from the location endpoint
    * def expectedResult = read ('locationResponse.json')
    Given path 'location'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate that the page not found response is being handle on the character endpoint
    Given path 'location/900'
    When method get
    Then status 404