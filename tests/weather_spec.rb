require "rspec"
require "OpenWeather"
require "json"

describe "Fetch Weather" do

  it "should get proper coordinates" do
    owc = OpenWeather::Client.new
    weather = owc.weather_raw "Montreal"
    weather['coord']['lon'].should == -73.587807
    weather['coord']['lat'].should == 45.508839
  end

  it "should return unknown city" do
    owc = OpenWeather::Client.new
    weather = owc.weather_raw "FakeCity123"
    weather['message'].should == "Error: Not found city"
    weather['cod'].should == "404"
  end
end