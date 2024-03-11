require 'watir'
require 'pry'

Before do
    $stdout.sync = true
    @browser = Watir::Browser.new :chrome
    @browser.window.maximize
    @product_ecommerce1 = []
    @product_ecommerce2 = []
end
After do
    @browser.close
end