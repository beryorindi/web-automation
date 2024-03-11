Feature: Sort ascending phone by price in ecommerce website

Scenario: Get product list and sory ascending by price 
    # Get product information in first ecommerce 
    Given user goes to "tokopedia" home page
    When user search "iPhone 15 Pro" in "tokopedia" page
    Then user validate search result in "tokopedia" is correct
    And user store product information from "tokopedia" 
    # Get product information in second ecommerce 
    Given user goes to "bukalapak" home page
    When user search "iPhone 15 Pro" in "bukalapak" page
    And user validate search result in "bukalapak" is correct
    And user store product information from "bukalapak"  
    # Sort product by price ascending
    Then user get combined product sort by ascending price 