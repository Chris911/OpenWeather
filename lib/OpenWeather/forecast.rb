module OpenWeather
  module Forecast
    def forecast_raw(city)
      @city_file.nil? ?
          get('/forecast', query: {q: city, units: @units_format, mode: @data_format}) :
          JSON.parse(File.read(@city_file))
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

    def forecast_tomorrow_rain?(city)
      forecast = forecast_raw(city)
      tomorrow_list = forecast['list'].select { |weather| weather['dt_txt'].split(" ")[0] == tomorrow  }
      # This selects any period of time during the day where the condition code is between 500 and 599 which
      # corresponds to rainy condition. If the array is empty that means it won't rain so we return the opposite.
      ! tomorrow_list.select { |code| Integer(code['weather'][0]['id']).between?(500, 599) }.empty?
    end

  end
end