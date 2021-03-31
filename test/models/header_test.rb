require 'test_helper'

class HeaderTest < ActiveSupport::TestCase
  
  test "belongs_to member" do
    header = Header.new
    assert header.respond_to? :member    
  end

end
