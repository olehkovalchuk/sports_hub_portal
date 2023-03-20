# == Schema Information
#
# Table name: answers
#
#  id         :uuid             not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid             not null
#
# Indexes
#
#  index_answers_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
class Answer < ApplicationRecord
  belongs_to :survey

  validates :text, presence: true, length: { maximum: 255 }
end
