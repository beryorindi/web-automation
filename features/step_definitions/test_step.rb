Given(/^user goes to "([^"]*)" home page$/) do |website|
    case website
    when 'tokopedia'
        @browser.goto("https://www.tokopedia.com/")
    when 'bukalapak'
        @browser.goto("https://bukalapak.com/")
    end
end

When(/^user search "([^"]*)" in "([^"]*)" page$/) do |search, website|
    @search = search.downcase
    case website 
    when 'tokopedia'
        search_field = @browser.text_field(xpath: "//input[@type='search']")
    when 'bukalapak'
        search_field = @browser.text_field(xpath: "//input[@name='search[keywords]']")
    end
    search_field.set @search
    search_field.send_keys(:enter)
end

Then(/^user validate search result in "([^"]*)" is correct$/) do |website|
    case website 
    when 'tokopedia'
        product_list_name = @browser.divs(xpath: "//div[@data-testid='spnSRPProdName']")
    when 'bukalapak'
        product_list_name = @browser.divs(xpath: "//div[@class='bl-product-card-new__description']/section/p/a")
    end
    result = true
    product_list_name.each do |element|
        element_downcase = element.text.downcase
        if !element_downcase.include?(@search)
            result = false
            break
        end
    end
    expect(result).to be true
end

And(/^user store product information from "([^"]*)"$/) do |website|
    Watir::Wait.until { @browser.ready_state == 'complete' }
    case website 
    when 'tokopedia'
        products_ecommerce1 = []
        products_name = @browser.divs(xpath: "//div[@data-testid='spnSRPProdName']")
        products_price = @browser.divs(xpath: "//div[@data-testid='spnSRPProdPrice']")
        products_link = @browser.as(xpath: "//div[@data-testid='spnSRPProdPrice']/preceding::a[1]")
        products_name.zip(products_price, products_link).each do |name, price, link|
            link_value = link.attribute_value('href')
            product = { website: 'tokopedia', name: name.text, price: price.text, link: link_value }
            products_ecommerce1 << product
        end
        products_ecommerce1.each do |product|
            puts "Website: #{product[:website]}"
            puts "Name: #{product[:name]}"
            puts "Price: #{product[:price]}"
            puts "Link: #{product[:link]}"
            puts "------------------------"
        end
    when 'bukalapak'
        products_name = @browser.as(xpath: "//div[@class='bl-product-card-new__description']/section/p/a")
        products_price = @browser.ps(xpath: "//div[@class='bl-product-card-new__price-and-currency']/p[2]")
        products_link = @browser.as(xpath: "//section[@class='bl-product-card-new__name']/p/a")
        product_ecommerce2 = []
        products_name.zip(products_price, products_link).each do |name, price, link|
            link_value = link.attribute_value('href')
            product = { website: 'bukalapak', name: name.text, price: price.text, link: link_value  }
            product_ecommerce2 << product
        end
        product_ecommerce2.each do |product|
            puts "Website: #{product[:website]}"
            puts "Name: #{product[:name]}"
            puts "Price: #{product[:price]}"
            puts "Link: #{product[:link]}"
            puts "------------------------"
        end
    end
end

