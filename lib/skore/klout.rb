require 'klout'
# This module analize and extract score from social analizer http://klout.com
module Skore
  class KloutSkore

    # Include module and clases from Klout
    include Klout

    attr_accessor :user

    # Initialize Base and almacenate user information
    def initialize(api_key)
      raise ArgumentError, 'api_key is required' if api_key == nil || api_key.empty?
      Klout.api_key = api_key
    end

    # Get score for user
    def score(username, round=false)
      begin
        identity = Identity.find_by_screen_name(username)
        @user = User.new(identity.id)
        if round
          @user.score.score.round
        else
          @user.score.score
        end
      rescue
        nil
      end
    end

  end
end