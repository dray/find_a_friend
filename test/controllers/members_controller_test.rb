require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_url
    
    assert_response :success
  end

  test "should get show" do
    info = {first_name: "Daniel", last_name: "Cox", original_url: "www.apple.com"}
    member =  Member.create(info)
    
    get member_url(member)
    
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    
    assert_response :success
  end

  test "should post create" do
    post members_url, params: { member: {first_name: "Daniel", last_name: "Cox", original_url: "www.apple.com"} }
    
    assert_redirected_to member_url(Member.last)
  end
end
