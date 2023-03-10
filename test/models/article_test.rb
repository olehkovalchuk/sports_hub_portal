# == Schema Information
#
# Table name: articles
#
#  id           :bigint           not null, primary key
#  caption      :string           not null
#  comments     :boolean          default(TRUE), not null
#  content      :text             not null
#  file_data    :text
#  location     :string
#  main_page    :boolean          default(TRUE), not null
#  name         :string           not null
#  picture_text :string           not null
#  type         :string           default("article"), not null
#  url_data     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint           not null
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
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
