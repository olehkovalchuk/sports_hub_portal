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
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
