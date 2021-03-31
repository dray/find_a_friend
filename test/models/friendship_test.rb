require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

  test "belongs_to member" do
    assert Friendship.new.respond_to? :member
  end

  test "belongs_to friend" do
    assert Friendship.new.respond_to? :friend
  end

  test "friendships have inverse relationships" do
    member_info = {first_name: 'Daniel', last_name: 'Cox', original_url: 'www.apple.com'}
    other_member_info = {first_name: 'Joe', last_name: 'Smith', original_url: 'www.microsoft.com'}
    member = Member.create(member_info)
    other_member = Member.create(other_member_info)
    
    member.friendships.create(friend_id: other_member.id)

    assert_equal member.friends.first, other_member
    assert_equal other_member.friends.first, member
  end
  
end
