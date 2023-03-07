# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  caption      :string
#  comments     :boolean          default(TRUE)
#  content      :text
#  file_data    :text
#  location     :string
#  main_page    :boolean          default(TRUE)
#  name         :string
#  picture_text :string
#  type         :string           default("article")
#  url_data     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint
#  category_id  :bigint
#  team_id      :bigint
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
  belongs_to :category
  belongs_to :team
  belongs_to :author, class_name: 'User'

  has_many :comments, class_name: "Comment", foreign_key: "article_id"
end
