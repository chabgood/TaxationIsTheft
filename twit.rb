require 'twitter'
class Twit
  attr_accessor :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def run
    tax = 'taxationistheft'.chars.map { |c| (rand 2) == 0 ? c : c.upcase }.join
    client.update("@realDonaldTrump
      ##{tax}")
  end
end
twit = Twit.new
twit.run
