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
class Survey < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :answers, class_name: "Answer", dependent: :destroy
  has_many :survey_responders, class_name: "SurveyResponder", dependent: :destroy
  has_many :responders, through: :survey_responders, source: :responder

  validates :question, presence: true
  validates :due_date, comparison: { greater_than: Date.today }, allow_nil: true
  enum :status, { "not_published" => 0, "published" => 1, "closed" => 2}
end
