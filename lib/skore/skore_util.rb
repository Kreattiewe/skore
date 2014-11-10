module Skore
  class SkoreUtil

    def initialize(options = {})
      @klout_api_key = options[:klout_api_key]
      @peerindex_api_key = options[:peerindex_api_key]
      @kred_app_id = options[:kred_app_id]
      @kred_app_key = options[:kred_app_key]
    end

    def score(social_network, username)
      result = {}
      case social_network.to_sym
        when :twitter then
          result[:klout] = Skore::KloutSkore.new(@klout_api_key).score(username, true)
          result[:peerindex] = Skore::PeerIndex.new(@peerindex_api_key).score(username)
          result[:kred] = Skore::Kred.new(@kred_app_id, @kred_app_key).score(social_network.to_sym, username)
        else
          result[:klout] = Skore::KloutSkore.new(@klout_api_key).score(username, true)
      end
      result
    end

  end
end