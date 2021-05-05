Feature: Validate that the episode endpoint is retorning the right response body and status

  Background:
    * url 'https://rickandmortyapi.com/api'

  Scenario: Validate the response code from the episode endpoint
    Given path 'episode'
    When method get
    Then status 200

  Scenario: Validate the content type from the episode endpoint
    Given path 'episode'
    When method get
    Then status 200
    Then match header Content-Type == 'application/json; charset=utf-8'

  Scenario: Validate the response content from the episode endpoint
    * def expectedResult = read ('episodeResponse.json')
    Given path 'episode'
    When method get
    Then status 200
    And match response == expectedResult

  Scenario: Validate that the page not found response is being handle on the episode endpoint
    Given path 'episode/900'
    When method get
    Then status 404