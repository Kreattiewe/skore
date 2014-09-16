require 'httparty'

##
# This module analize and extract score from social analizer http://kred.com
module Skore
	class PeerIndex 

		##
		# Include httparty module from http querys
		include HTTParty
		default_timeout 1

		attr_accessor :data 

		##
		# Initialize and load data from kred api
		def initialize(api_key, username)
			begin
				@data = self.class.get("https://api.peerindex.com/1/actor/topic?twitter_screen_name=#{username}&api_key=#{api_key}")
			rescue Timeout::Error
				@data = false
			end
		end

		##
		# Get core from peerindex api
		def score
			if @data
				result = JSON.parse(@data.body)
				result["peerindex"]
			else
				-1
			end
		end

	end
end