OpenWeatherAPI.configure do |config|
    # API key
    config.api_key = Rails.application.credentials.weather_api[:api_key]
  
    # Optionals
    config.default_language = 'en'     # 'en' by default
    config.default_country_code = 'en' # nil by default (ISO 3166-1 alfa2)
    config.default_units = 'metric'    # 'metric' by default
end