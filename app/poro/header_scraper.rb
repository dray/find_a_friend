require "open-uri"

class HeaderScraper

  def initialize(member)
    @member = member
  end

  def self.call(*args)
    new(*args).scrape_headers
  end

  def scrape_headers 
    begin
      doc = Nokogiri::HTML(URI.open("https://#{@member.original_url}"))
      headers = doc.css("h1, h2, h3").map { |h| h.text.strip }
    rescue SocketError, Errno::ECONNREFUSED, Errno::ENOENT => error
      puts "Error: #{error.message}"
    end
    headers
  end
end