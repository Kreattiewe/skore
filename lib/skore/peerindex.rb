require 'httparty'

# This module analize and extract score from social analizer http://kred.com
module Skore
	class PeerIndex 

		# Include httparty module from http querys
		include HTTParty
		base_uri 'https://api.peerindex.com/1/actor/topic'
		default_timeout 1

		attr_accessor :data 

		# Initialize and load data from kred api
		def initialize(api_key)
      raise ArgumentError, 'api_key is required' if api_key == nil || api_key.empty?
      @api_key = api_key
		end

		# Get core from peerindex api
		def score(username)
      begin
        @data = self.class.get("?twitter_screen_name=#{username}&api_key=#{@api_key}", verify: false)
        result = @data ? JSON.parse(@data.body) : nil
        result['peerindex'] if result
      rescue Timeout::Error
        nil
      end
		end

	end
end