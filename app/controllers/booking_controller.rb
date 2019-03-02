class BookingController < ApplicationController
  def index
    open_weather_api = Rails.configuration.open_weather_api
    weather = open_weather_api.forecast :hourly, city: "Stockholm", country_code: "se", default_unit: "metric"
    @forecasts = []
    
    weather['list'].each do |forecast|
      if forecast["dt_txt"].split(' ').last == "15:00:00"
        @forecasts << forecast
      end
    end
  end
end
