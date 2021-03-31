require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  test "create valid member" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    member = Member.new(member_info)

    assert member.valid?    
  end

  test "#name returns name of member" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    member = Member.new(member_info)
    
    assert_equal member.name, "Daniel Cox"
  end

end