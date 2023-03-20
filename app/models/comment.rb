# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :uuid             not null
#  author_id  :uuid             not null
#  parent_id  :uuid
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_author_id   (author_id)
#  index_comments_on_parent_id   (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Comment", optional: true            

  has_many :children, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
  has_many :comment_reactions, class_name: "CommentReaction", dependent: :destroy

  validates :text, presence: true
end
