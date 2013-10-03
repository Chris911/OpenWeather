require 'httparty'

require "OpenWeather/version"
require "OpenWeather/forecast"
require "OpenWeather/weather"
require "OpenWeather/utilities"

module OpenWeather
  class Client
    include HTTParty

    [Forecast, Weather, Utilities].each do |inc|
      include inc
    end

    attr_accessor(:units_format, :data_format)

    # Open Weather Map Client
    #
    # @param opts [Hash] A hash of options
    # @option opts [String] :url The Open Weather Map API URL.
    # @option opts [String] :useragent Useragent used for the request
    # @option opts [String] :api_key Your API key if you have one
    def initialize( opts = {} )
      options = {url: "http://api.openweathermap.org/data/2.5", useragent: "Open Weather Ruby v#{VERSION}"}.merge opts
      @baseurl = options[:url]
      @headers = {'User-Agent' => options[:useragent]}
      # For HTTParty
      self.class.base_uri options[:url]
      self.class.headers @headers

      @units_format = 'celcius'
      @data_format  = 'json'
      @api_key = options[:api_key] if options[:api_key]
    end
  end
end
