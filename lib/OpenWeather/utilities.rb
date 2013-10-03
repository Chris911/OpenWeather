module OpenWeather
  # Utility functions.
  #
  # @author Mostly https://github.com/paradox460/snoo
  module Utilities

    private
    # HTTParty get wrapper. This serves to clean up code, as well as throw webserver errors wherever needed
    #
    def get *args, &block
      response = self.class.get *args, &block
      raise WebserverError, response.code unless response.code == 200
      response
    end

    # HTTParty POST wrapper. This serves to clean up code, as well as throw webserver errors wherever needed
    #
    def post *args, &block
      response = self.class.post *args, &block
      raise WebserverError, response.code unless response.code == 200
      response
    end
  end
end