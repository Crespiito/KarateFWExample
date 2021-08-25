Feature: Get Tests on reqres.in
 Background:
   * def urldom = 'https://reqres.in'
   * def path = '/api/users'
  Scenario: Get users list
    Given url urldom + path + '?page=2'
    When method GET
    Then status 200
    And match $..id contains '#notnull'
    And match $..id contains 7


  Scenario Outline: Post users <description>
    * def path = '/api/login'
    Given url urldom + path
    And request {"email": <username>,"password": <password>}
    When method POST
    Then status <status_code>
    * print response
    Examples:
      |username |password | status_code | description |
      |'eve.holt@reqres.in' |'cityslicka' | 200 | valid user |
      |'eve.holt@reqres.in' |null | 400 | invalid user|