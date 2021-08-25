Feature: Get Tests on reqres.in
  Background:
    * def urldom = 'https://reqres.in'
  Scenario Outline: Post users <description>
    * def path = '/api/login'
    * def result = call read("testapi2.feature@esc3") { email:<username> }
    * print result.response.token
    Examples:
      |username |password | status_code | description |
      |'eve.holt@reqres.in' |'cityslicka' | 200 | valid user |
      |'eve.holt@reqres.in' |null | 400 | invalid user|