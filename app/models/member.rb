class Member < ApplicationRecord
    validates :first_name, :last_name, :original_url, presence: true
  
    def name
      "#{self.first_name} #{self.last_name}"
    end  
    
    private

    def shorten_url
      short_url = UrlShortener.call(self)
      self.update(short_url: short_url)
    end

end
  