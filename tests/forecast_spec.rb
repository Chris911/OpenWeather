require "OpenWeather"
require "rspec"

describe "Fetch Forecast" do

  it "should get proper coordinates" do
    owc = OpenWeather::Client.new
    forecast = owc.forecast_raw "Montreal"
    forecast['city']['coord']['lon'].should == -73.587807
    forecast['city']['coord']['lat'].should == 45.508839
  end

  it "min should be smaller than max" do
    owc = OpenWeather::Client.new
    min = owc.forecast_tomorrow_min "Montreal"
    max = owc.forecast_tomorrow_max "Montreal"
    min.should <= max
  end
end