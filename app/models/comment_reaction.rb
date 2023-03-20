# == Schema Information
#
# Table name: comment_reactions
#
#  id         :uuid             not null, primary key
#  reaction   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :uuid             not null
#  user_id    :uuid             not null
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
class CommentReaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  enum reaction: { "dislike" => 0, "like" => 1 }
  
  validates :reaction, presence: true
  validates :reaction, uniqueness: { scope: [:comment_id, :user_id] }
end
