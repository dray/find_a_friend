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

  test "has_many friendships" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    member = Member.new(member_info)
    
    assert member.respond_to? :friendships
  end
  
  test "has_many friends" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    member = Member.new(member_info)
    
    assert member.respond_to? :friends
  end

  test "has_many headers" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    member = Member.new(member_info)
    
    assert member.respond_to? :headers
  end

end