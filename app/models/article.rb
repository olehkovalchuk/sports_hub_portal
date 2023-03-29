# == Schema Information
#
# Table name: articles
#
#  id           :uuid             not null, primary key
#  article_type :integer          default("article"), not null
#  caption      :string           not null
#  comments_on  :boolean          default(TRUE), not null
#  content      :text             not null
#  file_data    :text
#  location     :string
#  main_page    :boolean          default(TRUE), not null
#  name         :string           not null
#  picture_text :string           not null
#  status       :integer          default("not_published")
#  url_data     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :uuid             not null
#  category_id  :uuid
#  team_id      :uuid
#
# Indexes
#
#  index_articles_on_author_id    (author_id)
#  index_articles_on_category_id  (category_id)
#  index_articles_on_team_id      (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (team_id => teams.id)
#
class Article < ApplicationRecord
  ARTICLE_TYPE = 'article'
  VIDEO_TYPE= 'video'
  LIFESTYLE_TYPE = 'lifestyle'
  DEALBOOK_TYPE = 'dealbook'
  ARTICLE_TYPES = [ARTICLE_TYPE, VIDEO_TYPE, LIFESTYLE_TYPE, DEALBOOK_TYPE].freeze

  belongs_to :category, optional: true
  belongs_to :team, optional: true
  belongs_to :author, class_name: 'User'

  has_many :comments, class_name: "Comment", dependent: :destroy

  validates :article_type, inclusion: { in: ARTICLE_TYPES }
  validates :name, presence: true, length: { maximum: 255 }
  validates :caption, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :picture_text, presence: true, length: { maximum: 255 }

  enum :article_type, { article: 0, video: 1, lifestyle: 2, dealbook: 3 }, suffix: :type
  enum :status, { not_published: 0, published: 1 }

  
end
