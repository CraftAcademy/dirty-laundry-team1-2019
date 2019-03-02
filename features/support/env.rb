require 'cucumber/rails'
require 'webmock/cucumber'
WebMock.allow_net_connect!
require 'coveralls'
Coveralls.wear_merged!('rails')

World(FactoryBot::Syntax::Methods)

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Before '@api_call' do 
  WebMock.disable_net_connect!(allow_localhost: true)
    stub_request(:get, "http://api.openweathermap.org/data/2.5/forecast/?APPID=9f17e0746e709d22e5f04a5160c8abc2&lang=en&q=Stockholm,se").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip, deflate',
      'Host'=>'api.openweathermap.org',
      'User-Agent'=>'rest-client/2.0.2 (darwin18.2.0 x86_64) ruby/2.4.3p205'
      }).
    to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'weather_api_stub.txt').read, headers: {})
end