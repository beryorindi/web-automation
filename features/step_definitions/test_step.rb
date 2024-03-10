Given(/^user goes to "([^"]*)" home page$/) do |website|
    case website
    when 'lazada'
        @browser.goto("https://lazada.co.id/")
    when 'shopee'
        @browser.goto("https://shopee.co.id/")
    end
end

When(/^user search "([^"]*)" in "([^"]*)" page$/) do |search, website|
    @search = search
    case website 
    when 'lazada'
        search_field = @browser.text_field(id: 'q')
    when 'shopee'
        search_field = @browser.text_field(class: 'shopee-searchbar-input__input')
    end
    search_field.set @search
    search_field.set Keys.ENTER
end

Then(/^user validate search result in "([^"]*)" is correct$/) do |website|
    case website 
    when 'lazada'
        product_list_name = @browser.element(xpath: "//div[@data-qa-locator='general-products']/descendant::img[@type='product']/following::a[contains(@title,'iPhone 15 Pro')]")
    when 'shopee'
        product_list_name = @browser.text_field(xpath: "//li/a/descendant::div[2]/div[2]/div[1]/div[1]")
    end
    i = 0
    result = true
    for i < product_list_name.length
        if product_list_name[i].value != @search
            result = false
        end
    end
end