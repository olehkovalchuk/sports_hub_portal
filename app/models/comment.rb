# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  author_id  :bigint
#  parent_id  :bigint
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
  belongs_to :parent, class_name: "Comment"              

  has_many :children, class_name: "Comment", foreign_key: "parent_id" 
  has_many :comment_reactions, class_name: "CommentReaction", foreign_key: "comment_id"
end
