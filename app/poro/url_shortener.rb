require "shorturl"

class UrlShortener

  def initialize(member)
    @member = member
  end

  def self.call(*args)
    new(*args).shorten_url
  end
  
  def shorten_url
    ShortURL.shorten(@member.original_url, :tinyurl)
  end
  
end
