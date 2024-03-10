require 'watir'
require 'pry'

Before do
    $stdout.sync = true
    @browser = Watir::Browser.new :chrome
    @browser.window.maximize
end
After do
    @browser.close
end