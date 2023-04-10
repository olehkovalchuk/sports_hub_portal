# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  ancestry   :string
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :uuid             not null
#  author_id  :uuid             not null
#
# Indexes
#
#  index_comments_on_ancestry    (ancestry)
#  index_comments_on_article_id  (article_id)
#  index_comments_on_author_id   (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord
  has_ancestry

  belongs_to :article
  belongs_to :author, class_name: "User"
  
  has_many :reactions, class_name: "CommentReaction", dependent: :destroy

  validates :text, presence: true
  validate :comment_parent
  validate :comment_depth

  def root?
    parent_id.nil?
  end

  private

  def comment_parent
    return if parent_id.nil?
    errors.add(:parent, 'invalid') if parent.nil? || parent.article_id != article_id 
  end
  def comment_depth
    return if depth <= 2
    errors.add(:comment, 'too deep comment')
  end
end
