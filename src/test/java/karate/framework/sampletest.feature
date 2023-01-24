Feature: Customer Details
  In this feature we are adding a new user and thier details

  Background: Steps
    * url 'http://localhost:3000'
    * header content-type = 'application/json'

  Scenario: Get Customer records using Get method
    Given path '/customer/3'
    When method GET
    Then status 200
    And print response

  Scenario: Getting Customer records using Get method
    Given path '/customer/5'
    And request {firstname:'abc',lastname:'xyz',country:'INDIA'}
    When method PUT
    Then status 200
    And match response.firstname == 'abc'
    And print response

  Scenario: Deleting Customer records using Get method
    Given path '/customer/3'
    When method DELETE
    Then status 200
    And print response

  Scenario Outline: Creating customers by fetching data from csv
    Given path '/customer'
    And request {firstname:'<firstname>',lastname:'<lastname>',country:'<country>'}
    When method POST
    Then status 201
    And match $.id == '#ignore'

    Examples: 
      | read('data.csv') |
