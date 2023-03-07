# == Schema Information
#
# Table name: surveys
#
#  id         :bigint           not null, primary key
#  due_date   :date
#  question   :string
#  status     :string           default("not_published")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_surveys_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Survey < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :answers, class_name: "Answer", foreign_key: "survey_id"
  has_many :survey_responders, class_name: "SurveyResponder", foreign_key: "survey_id"
  has_many :responders, through: :survey_responders, source: :user

end
