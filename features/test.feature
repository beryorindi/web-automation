Feature: Search Iphone in ecommerce webstie

@lazada
Scenario: Get iPhone list in lazada 
    Given user goes to "lazada" home page
    When user search "iPhone 15 pro" in "lazada" page
    Then user validate search result in "lazada" is correct

@shopee
Scenario: Get iPhone list in shopee 
    Given user goes to "shopee" home page
    When user search "iPhone 15 pro" in "shopee" page
    And user validate search result in "shopee" is correct