require 'twitter'
class JobForYou

  def tweet
    # puts new_job
    client.update(new_job)
  end

  def new_job
    phrase = [hook, duration, role, occupation, preposition, reputation, industry, setup]
    phrase.join(' ')
  end

  def hook
    random_phrase_from('hooks.txt')
  end

  def duration
    random_phrase_from('durations.txt')
  end

  def role
    random_phrase_from('roles.txt')
  end

  def occupation
    random_phrase_from('occupations.txt')
  end

  def reputation
    random_phrase_from('reputations.txt')
  end

  def industry
    random_phrase_from('industries.txt')
  end

  def setup
    random_phrase_from('setups.txt')
  end

  def preposition
    %w(at for in).sample
  end

  def random_phrase_from(filename)
    open("lib/#{filename}").read.split("\n").sample
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
    end
  end
end


JobForYou.new.tweet
