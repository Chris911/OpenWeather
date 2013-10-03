module OpenWeather

  # Thrown whenever the webserver returns anything but 200
  #
  class WebserverError < StandardError
  end
end