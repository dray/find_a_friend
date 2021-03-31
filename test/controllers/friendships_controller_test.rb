require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "post create friendship" do
    member_data = {first_name: "Daniel", last_name: "Cox", original_url: "www.apple.com"}
    member_data2 = {first_name: "Joe", last_name: "Smith", original_url: "www.microsoft.com"}
    member = Member.create(member_data)
    other_member = Member.create(member_data2)

    post friendships_url, params: { friend_id: other_member.id, id: member.id }
    
    assert_redirected_to member_url(member)
  end
end
