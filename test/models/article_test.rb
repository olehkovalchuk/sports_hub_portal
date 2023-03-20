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
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
