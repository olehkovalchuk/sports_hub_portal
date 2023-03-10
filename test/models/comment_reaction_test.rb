# == Schema Information
#
# Table name: comment_reactions
#
#  id         :bigint           not null, primary key
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comment_reactions_on_comment_id  (comment_id)
#  index_comment_reactions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (comment_id => comments.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CommentReactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
