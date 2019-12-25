# chromedriver-helper を使わずに、自分で chromedriver を設定するため
# pathをローカル環境に設定
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "/mnt/d/webpro/chromedriver_win32/chromedriver.exe"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # test driver
  config.before(:each, :type, :system) do
    driven_by :rack_test
  end
  # test driver with javascript
  config.before(:each, :type, :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
