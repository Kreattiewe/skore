require 'httparty'

# This module analize and extract score from social analizer http://kred.com
module Skore
  class Kred

    # Include httparty module from http querys
    include HTTParty

    base_uri 'http://api.kred.com/kredscore'
    default_timeout 1

    attr_accessor :data

    # Initialize and load data from kred api
    def initialize(app_id, app_key)
      raise ArgumentError, 'app_id is required' if app_id == nil || app_id.empty?
      raise ArgumentError, 'api_key is required' if app_key == nil || app_key.empty?
      @app_id = app_id
      @app_key = app_key
    end

    # Get score from Kred api
    def score(social_network, username)
      begin
        @data = self.class.get("?term=#{username}&source=#{social_network}&app_id=#{@app_id}&app_key=#{@app_key}", verify: false)
        result = @data ? JSON.parse(@data.body) : nil
        result['data'][0]['influence'] if result && result['data']
      rescue Timeout::Error
        nil
      end
    end

  end
end