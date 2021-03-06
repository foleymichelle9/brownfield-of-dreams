require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless

Capybara.configure do |config|
  config.default_max_wait_time = 5
end

SimpleCov.start "rails"

# SimpleCov.start do
#   "rails"
#   add_filter "/app/channels/application_cable/channel.rb"
# end


Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :uid => '01234',
      :credentials => {token: ENV['GITHUB_ACCESS_TOKEN']}
      })
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<YOUTUBE_API_KEY') { ENV['YOUTUBE_API_KEY'] }
  config.filter_sensitive_data('<GITHUB_ACCESS_TOKEN') { ENV['GITHUB_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<SECOND_GITHUB_ACCESS_TOKEN') { ENV['SECOND_GITHUB_ACCESS_TOKEN'] }
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end
# VCR.configure do |config|
#   config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
#   config.hook_into :webmock
    # config
# end