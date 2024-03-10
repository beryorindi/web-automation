Feature: Search Iphone in ecommerce website

@tokopedia
Scenario: Get iPhone list in tokopedia 
    Given user goes to "tokopedia" home page
    When user search "iPhone 15 Pro" in "tokopedia" page
    Then user validate search result in "tokopedia" is correct

@bukalapak
Scenario: Get iPhone list in bukalapak 
    Given user goes to "bukalapak" home page
    When user search "iPhone 15 Pro" in "bukalapak" page
    And user validate search result in "bukalapak" is correct