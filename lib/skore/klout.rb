require 'klout'
##
# This module analize and extract score from social analizer http://klout.com
module Skore 
	class KloutSkore

		##
		# Include module and clases from Klout
		include Klout

		attr_accessor :user
		##
		# Initialize Base and almacenate user information
		def initialize(api_key, username)
			begin
				Klout.api_key = api_key 
				identity = Identity.find_by_screen_name(username)
				@user = User.new(identity.id)
			rescue
				@error = true
			end
		end

		##
		# Get score for user
		def score(round=false)
			if !@error
				if round then @user.score.score.round else @user.score.score end
			else
				-1
			end
		end


	end
end