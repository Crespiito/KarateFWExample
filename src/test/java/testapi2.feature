Feature: Get Tests on reqres.in
  Background:
    * def urldom = 'https://reqres.in'
    * def path = '/api/users'


  @esc1
  Scenario: Get users list
    Given url urldom + path + '?page='1
    When method GET
    Then status 200
    And match $..id contains '#notnull'

  @esc2
  Scenario: Get users list
    Given url urldom + path + '?page=1'
    When method GET
    Then status 200
    And match $..id contains '#notnull'


  @esc3
  Scenario: Post users <description>
    * def path = '/api/login'
    Given url urldom + path
    * def req = read("rq.json")
    And request req
    When method POST
    Then status 200