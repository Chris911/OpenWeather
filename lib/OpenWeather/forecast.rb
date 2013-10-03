module OpenWeather
  module Forecast
    def forecast_raw(city)
      get('/forecast', query: { q: city, units: @units_format, mode: @data_format })
    end

    def forecast_tomorrow_min(city)
      forecast = forecast_raw(city)
      tomorrow_list = forecast['list'].select { |weather| weather['dt_txt'].split(" ")[0] == tomorrow  }
      tomorrow_list.min_by { |temp| temp['main']['temp_min'] }['main']['temp_min']
    end

    def forecast_tomorrow_max(city)
      forecast = forecast_raw(city)
      tomorrow_list = forecast['list'].select { |weather| weather['dt_txt'].split(" ")[0] == tomorrow  }
      tomorrow_list.max_by { |temp| temp['main']['temp_max'] }['main']['temp_max']
    end

  end
end