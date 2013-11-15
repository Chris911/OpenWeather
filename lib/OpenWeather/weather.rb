module OpenWeather
  module Weather
    def weather_raw(city)
      city.is_number? ?
          query = {id: city, units: @units_format, mode: @data_format} :
          query = {q: city, units: @units_format, mode: @data_format}
      @city_file.nil? ?
          get('/weather', query: query) :
          JSON.parse(File.read(@city_file))
    end

    def weather_min(city)
      weather = weather_raw(city)
      weather['main']['temp_min']
    end

    def weather_max(city)
      weather = weather_raw(city)
      weather['main']['temp_max']
    end
  end
end