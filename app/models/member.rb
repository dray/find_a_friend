class Member < ApplicationRecord
  include Searchable
  validates :first_name, :last_name, :original_url, presence: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :headers

  after_create :scrape_headers, :shorten_url

  def name
    "#{self.first_name} #{self.last_name}"
  end  
  
  private

  def scrape_headers
    headers = HeaderScraper.call(self)
    headers.each do |head|
      self.headers.create(text: head)
    end
  end

  def shorten_url
    short_url = UrlShortener.call(self)
    self.update(short_url: short_url)
  end
end
  