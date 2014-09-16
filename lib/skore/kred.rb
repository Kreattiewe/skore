require 'httparty'

##
# This module analize and extract score from social analizer http://kred.com
module Skore
	class Kred 

		##
		# Include httparty module from http querys
		include HTTParty
		default_timeout 1

		attr_accessor :data 

		##
		# Initialize and load data from kred api
		def initialize(app_id, app_key, username)
			begin
				@data = self.class.get("http://api.kred.com/kredscore?term=#{username}&source=twitter&app_id=#{app_id}&app_key=#{app_key}")
			rescue Timeout::Error
				@data = false
			end
		end

		##
		# Get score from Kred api
		def score
			if @data
				result = JSON.parse(@data.body)
				result["data"][0]["influence"]
			else
				-1
			end
		end

	end
end