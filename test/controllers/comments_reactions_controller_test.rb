require "test_helper"

class CommentsReactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get comments_reactions_update_url
    assert_response :success
  end
end
