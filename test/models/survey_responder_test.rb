# == Schema Information
#
# Table name: survey_responders
#
#  id               :bigint           not null, primary key
#  responder_answer :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  responder_id     :bigint           not null
#  survey_id        :bigint           not null
#
# Indexes
#
#  index_survey_responders_on_responder_id  (responder_id)
#  index_survey_responders_on_survey_id     (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (responder_id => users.id)
#  fk_rails_...  (survey_id => surveys.id)
#
require "test_helper"

class SurveyResponderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
