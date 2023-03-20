# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  due_date   :date
#  question   :string           not null
#  status     :integer          default("not_published"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :uuid             not null
#
# Indexes
#
#  index_surveys_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
