require 'cucumber/rails'
require 'coveralls'
Coveralls.wear_merged!('rails')

World(FactoryBot::Syntax::Methods)

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }

Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)
end