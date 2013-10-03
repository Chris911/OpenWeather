module OpenWeather
  module Forecast
    def forecast_raw(city)
      get('/forecast', query: { q: city, units: @units_format, mode: @data_format })
    end

    def forecast_tomorrow_min(city)
      forecast = forecast_raw(city)
      min_temp = 9999999
      forecast['list'].each do |weather|
        day = weather['dt_txt'].split(" ")[0]
        next if day == today
        break if day > tomorrow
        min_temp = weather['main']['temp_min'] if weather['main']['temp_min'] < min_temp
      end
      min_temp
    end

    def forecast_tomorrow_max(city)
      forecast = forecast_raw(city)
      max_temp = -9999999
      forecast['list'].each do |weather|
        day = weather['dt_txt'].split(" ")[0]
        next if day == today
        break if day > tomorrow
        max_temp = weather['main']['temp_max'] if weather['main']['temp_max'] > max_temp
      end
      max_temp
    end

  end
end