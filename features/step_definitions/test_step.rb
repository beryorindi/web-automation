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



