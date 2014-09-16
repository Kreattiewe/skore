require 'httparty'

##
# This module analize and extract score from social analizer http://kred.com
module Skore
	class Kred 

		##
		# Include httparty module from http querys
		include HTTParty

		attr_accessor :data 
		##
		# Initialize and load data from kred api
		def initialize(app_id, app_key, username)
			@data = self.class.get("http://api.kred.com/kredscore?term=#{username}&source=twitter&app_id=#{app_id}&app_key=#{app_key}")
		end

		def score
			result = JSON.parse(@data.body)
			result["data"][0]["influence"]
		end

	end
end