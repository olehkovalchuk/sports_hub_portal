# == Schema Information
#
# Table name: survey_responders
#
#  id               :uuid             not null, primary key
#  responder_answer :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  responder_id     :uuid             not null
#  survey_id        :uuid             not null
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
class SurveyResponder < ApplicationRecord
  belongs_to :survey
  belongs_to :responder, class_name: "User"

  validates :responder_answer, presence: true
end
