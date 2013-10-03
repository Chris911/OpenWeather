require 'httparty'

require "OpenWeather/version"

module OpenWeather
  class Client
    include HTTParty

    # Open Weather Map Client
    #
    # @param opts [Hash] A hash of options
    # @option opts [String] :url The Open Weather Map API URL.
    # @option opts [String] :useragent Useragent used for the request
    # @option opts [String] :apiKey Your API key if you have one
    def initialize( opts = {} )
      options = {url: "http://api.openweathermap.org/data/2.5/", useragent: "Open Weather Ruby v#{VERSION}"}.merge opts
      @baseurl = options[:url]
      @headers = {'User-Agent' => options[:useragent]}
    end
  end
end
