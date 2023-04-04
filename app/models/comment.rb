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

  def root?
    parent_id.nil?
  end


  def persisted?
    false
  end
end
